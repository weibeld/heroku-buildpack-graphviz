Heroku Buildpack: Graphviz
===========================

Install [Graphviz](http://www.graphviz.org/) on Heroku.


Description
-----------

This buildpack installs Graphviz to your application slug.

The installed Graphviz versions are:

- **Graphviz 2.40.1** for **Heroku-18** (package [`graphviz_2.40.1-2_amd64.deb`](https://packages.ubuntu.com/bionic/graphviz))
- **Graphviz 2.38.0** for **Heroku-16** (package [`graphviz_2.38.0-12ubuntu2_amd64.deb`](https://packages.ubuntu.com/xenial/graphviz))

The Graphviz packages are installed under the `/app/heroku-buildpack-graphviz` directory, and the Graphviz executables are located in `/app/heroku-buildpack-graphviz/usr/bin`. The latter directory is added to the `PATH`.


Usage
-----

~~~bash
heroku buildpacks:set https://github.com/weibeld/heroku-buildpack-graphviz.git
~~~

See Heroku documentation [here](https://devcenter.heroku.com/articles/buildpacks#using-a-custom-buildpack).


Usage together with other buildpacks
------------------------------------

To use this buildpack together with other buildpacks, use for example:

~~~bash
heroku buildpacks:add heroku/ruby
heroku buildpacks:add https://github.com/weibeld/heroku-buildpack-graphviz.git
~~~

See Heroku docmentation [here](https://devcenter.heroku.com/articles/using-multiple-buildpacks-for-an-app).

You can always check which buildpacks are currently set with:

~~~bash
heroku buildpacks
~~~


Verification
------------

Verify the installation of Graphviz with:

~~~bash
heroku run dot -V
~~~

Testing
-------

For development purposes, you can test the buildpack locally with the [test.sh](test.sh) script:

~~~bash
./test.sh
~~~

This runs the buildpack script in a local [Docker container](https://hub.docker.com/r/heroku/heroku/) of the Heroku-18 and Heroku-16 stacks.


License
-------

Licensed under the MIT License. See [LICENSE.md](LICENSE.md) file.
