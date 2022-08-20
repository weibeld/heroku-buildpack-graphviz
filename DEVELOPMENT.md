# Notes

## Installation method

The buildpack installs Graphviz by manually installing all the required [Ubuntu packages](https://packages.ubuntu.com) (Graphviz itself and its dependencies).

Usually, one would just use `apt-get install graphviz`, however, this doesn't work here, because the packages need to be installed to a custom directory in the application slug (which will later be deployed to the production dynos), and it's not possible to configure this with `apt-get`.

To work around this, the buildpack downloads all the required packages and installs them manually with `dpkg`.

## Get list of packages

The required packages include not only [`graphviz`](https://packages.ubuntu.com/bionic/graphviz) but also all of its dependencies, and dependencies of dependencies, etc. Furthermore, some of the dependent packages might be already installed on the system, so they don't need to be installed.

This can quickly get complicated, so the best way is to let `apt-get` figure out the concrete set of packages to install for a specific Heroku stack.

To do so for a specific Heroku stack, run a Docker container of the stack as follows:

```bash
docker run --rm -it heroku/heroku:<STACK>
```

In the above command, replace `<STACK>` with the number of the desired [Heroku stack](https://devcenter.heroku.com/articles/stack), i.e. **18**, **20**, or **22**.

> Important: only use a runtime image for this step and not a build image (e.g. [`heroku/heroku:22`](https://hub.docker.com/layers/heroku/heroku/heroku/22/images/sha256-025817fa6ae4af91990575f23f6b9a17d3e1573783a06cb0d09e6ad5f6755bab?context=explore) instead of [heroku/heroku:22-build](https://hub.docker.com/layers/heroku/heroku/heroku/22-build/images/sha256-b5623fc33ddb758010a1e5819a1ed231eed1a61844971f36e13910aac6d1eb61?context=explore)). This is because a build stack may already contain some of the dependent packages which would then miss on the runtime stack (see [here](https://devcenter.heroku.com/articles/stack-packages)).

Then, in the Docker container, run:

```bash
apt-get update
apt-get install -y --print-uris graphviz | grep http | awk '{print $1}' | tr -d "'"
```

This prints the URLs of the packages that `apt-get install graphviz` would install on this specific system.

This list can then be used in the `bin/compile` script for the corresponding Heroku stack.

By installing precisely this set of packages, as figured out by `apt-get`, the effect should be the same as running `apt-get install graphviz`.

## Testing

The buildpack can be tested in a Docker container for each supported Heroku stack as follows.

First, start the container by running the following command from the root directory of the repository:

```bash
docker run -ti --rm -v "$PWD":/app -e STACK=heroku-<STACK> heroku/heroku:<STACK>
```

In the above command, replace `<STACK>` with the number of the desired [Heroku stack](https://devcenter.heroku.com/articles/stack), i.e. **18**, **20**, or **22**.

> The `-v` option in the above command the mounts content of the current working directory (which must be the repo root directory) as a volume in the `/app` directory inside the container.

Then, within the container, change into the `/app` directory:

```bash
cd /app
```

And you can then run the `compile` script as follows:

```bash
bin/compile
```

Since your current working directory is `/app` (like on a production dyno), you can also source the `.profile.d` script, which adds the Graphviz installation directory to the `PATH`:

```bash
. .profile.d/graphviz.sh
```

And you can then test the installation of Graphviz as follows:

```bash
dot -V
```

The `example.gv` file in the repository contains an example Graphviz graph which allows to further test the correct functioning of Graphviz:

```bash
dot -Tpng example.gv >example.png
```

Since the resulting `example.png` file is created in `/app` directory which is a Docker volume, the file is automatically mapped back to your host system, that means, it will be available in the repository root directory.
