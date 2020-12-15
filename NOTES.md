# Notes

## Installation method

The buildpack installs Graphviz by manually installing all the required [Ubuntu packages](https://packages.ubuntu.com) (Graphviz itself and its dependencies).

Usually, one would just use `apt-get install graphviz`, however, this doesn't work here, because the packages need to be installed to a custom directory in the application slug (which will later be deployed to the production dynos), and it's not possible to configure this with `apt-get`.

To work around this, the buildpack downloads all the required packages and installs them manually with `dpkg`.

## Get list of packages

The required packages include not only [`graphviz`](https://packages.ubuntu.com/bionic/graphviz) but also all of its dependencies, and dependencies of dependencies, etc. Furthermore, some of the dependent packages might be already installed on the system, so they don't need to be installed.

This can quickly get complicated, so the best way is to let `apt-get` figure out the concrete set of packages to install for a specific Heroku stack.

To do so, run a specific Heroku stack as a Docker container:

```bash
docker run --rm -it heroku/heroku:16
# or
docker run --rm -it heroku/heroku:18
# or
docker run --rm -it heroku/heroku:20
```

> The build happens on the same stack that will also be used during production.

Then, in the Docker container, run:

```bash
apt-get update
apt-get install -y --print-uris graphviz | grep http | awk '{print $1}' | tr -d "'"
```

This prints the list of packages (more precisely, their URLs) that `apt-get install graphviz` would install on this specific system.

This list can then be used in the `bin/compile` script for the corresponding Heroku stack.

By installing precisely this set of packages, as figured out by `apt-get`, the effect should be the same as running `apt-get install graphviz`.

## Testing

The buildpack can be tested in a Docker container running a specific Heroku stack.

The `docker.sh` script allows to start such a Docker container:

```bash
./docker.sh 16
# or
./docker.sh 18
# or
./docker.sh 20
```

A volume mapping makes the current working directory (containing the buildpack) available under `/app` in the container.

So, inside the container, you can run the `compile` script of the buildpack with:

```bash
cd /app
bin/compile
```

Since the base directory is `/app` (like on a production dyno), you can also source the `.profile.d` script:

```bash
source .profile.d/graphviz.sh
```

The `example.gv` file contains an example Graphviz graph which allows to test the Graphviz installation:

```bash
dot -Tpng example.gv >example.png
```
