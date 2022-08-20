# Heroku Buildpack: Graphviz

Install [Graphviz](http://www.graphviz.org/) on Heroku.

## Description

This buildpack installs Graphviz on Heroku and makes it available to your Heroku application.

The installed version of Graphviz depends on the Heroku stack (which is automatically detected by the buildpack):

- [Heroku-22](https://devcenter.heroku.com/articles/heroku-22-stack) → [Graphviz 2.42.2](https://packages.ubuntu.com/jammy/graphviz)
- [Heroku-20](https://devcenter.heroku.com/articles/heroku-20-stack) → [Graphviz 2.42.2](https://packages.ubuntu.com/focal/graphviz)
- [Heroku-18](https://devcenter.heroku.com/articles/heroku-18-stack) → [Graphviz 2.40.1](https://packages.ubuntu.com/bionic/graphviz)

The Graphviz executables are installed to the following directory:

```
/app/.heroku-buildpack-graphviz/usr/bin
```

The above directory is added to the `PATH` environment variable, so Graphviz commands like `dot` and `neato` are directly available to your app without specifying their path.

## Enable

For adding the buildpack in addition with other buildpacks, use:

```bash
heroku buildpacks:add https://github.com/weibeld/heroku-buildpack-graphviz
```

For setting the buildpack as the only buildpack, use:

```bash
heroku buildpacks:set https://github.com/weibeld/heroku-buildpack-graphviz
```

You can verify that the buildpack has been added with:

```bash
heroku buildpacks
```

## Verify

After deploying your application with the buildpack at least once, you can verify the installation of Graphviz with:

```bash
heroku run dot -V
```

## Develop

For implementation notes, see [DEVELOPMENT.md](DEVELOPMENT.md).

## License

Licensed under the MIT License. See [LICENSE.md](LICENSE.md) file.
