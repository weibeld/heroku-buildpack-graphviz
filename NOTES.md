# Implementation notes

The aim is to install Graphviz with [Ubuntu packages](https://packages.ubuntu.com).

Usually, this could be done with `apt-get install graphviz`, however, in this case this doesn't work, because `apt-get` does not allow to install packages to a custom directory.

However, for a Heroku build, a custom installation directory is necessary, because the packages must be installed to the application "slug" which will later by deployed to the dynos.

To work around this, the packages must be downloaded and installed manually with `dpkg`.

## Get package URLs

To get the URLs of all the packages that `apt-get install graphviz` would install on each Heroku stack, proceeds as follows:

```bash
docker run --rm -it heroku/heroku:16
# or
docker run --rm -it heroku/heroku:18
```

In the Docker container:

```bash
apt-get update
apt-get install -y --print-uris graphviz | grep http | awk '{print $1}' | tr -d "'"
```

This list can then be hard-coded for every Heroku stack in the `bin/compile` script.
