# Heroku Buildpack: Graphviz

Install [Graphviz](http://www.graphviz.org/) on Heroku.

## Description

This buildpack installs Graphviz on and makes it available to your Heroku application.

The installed version of Graphviz is:

- [**Graphviz 2.42.2**](https://packages.ubuntu.com/focal/graphviz) for the [Heroku-20 stack](https://devcenter.heroku.com/articles/heroku-20-stack)
- [**Graphviz 2.40.1**](https://packages.ubuntu.com/bionic/graphviz) for the [Heroku-18 stack](https://devcenter.heroku.com/articles/heroku-18-stack)
- [**Graphviz 2.38.0**](https://packages.ubuntu.com/xenial/graphviz) for the [Heroku-16 stack](https://devcenter.heroku.com/articles/heroku-16-stack)

The Graphviz executables are installed to the following directory (from where they are available to your app):

```
/app/.heroku-buildpack-graphviz/usr/bin
```

The buildpack also adds this directory to the `PATH`, so your app can directly use the Graphviz executables (like `dot` and `neato`) as simple commands.

## Enable

Add the buildpack in addition to other buildpacks:

```bash
heroku buildpacks:add https://github.com/weibeld/heroku-buildpack-graphviz
```

Or set the buildpack as the only buildpack:

```bash
heroku buildpacks:set https://github.com/weibeld/heroku-buildpack-graphviz
```

## Verify

After running the buildpack, you can verify the installation of Graphviz with:

```bash
heroku run dot -V
```

## Develop

For implementation notes, see [NOTES.md](NOTES.md).

## License

Licensed under the MIT License. See [LICENSE.md](LICENSE.md) file.
