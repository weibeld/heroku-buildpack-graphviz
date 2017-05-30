Heroku Buildpack: Graphviz
===========================

Install [Graphviz](http://www.graphviz.org/) on Heroku.


Description
-----------

This buildpack installs Graphviz to your application slug.

The installed Graphviz versions are:

- **Graphviz 2.38.0** for **Heroku-16** (package [`graphviz_2.38.0-12ubuntu2_amd64.deb`](https://packages.ubuntu.com/xenial/graphviz))
- **Graphviz 2.36.0** for **Cedar-14** (package [`graphviz_2.36.0-0ubuntu3.1_amd64.deb`](https://packages.ubuntu.com/trusty/graphviz))

The Graphviz packages are installed under the `/app/heroku-buildpack-graphviz` directory, and the Graphviz executables are located in `/app/heroku-buildpack-graphviz/usr/bin`. The latter directory is added to the `PATH`.


Usage
-----

~~~bash
heroku buildpacks:set https://github.com/weibeld/heroku-buildpack-graphviz.git
~~~

See Heroku documentation [here](https://devcenter.heroku.com/articles/buildpacks#using-a-custom-buildpack).


Usage together with other buildpacks
------------------------------------

To use this buildpack along with other buildpacks:

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


License
-------

Licensed under the MIT License. See [LICENSE.md](LICENSE.md) file.
