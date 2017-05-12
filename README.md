Heroku Buildpack: Graphviz
===========================

Install [Graphviz](http://www.graphviz.org/) on Heroku.


Description
-----------

This buildpack installs the Graphviz binaries to `/app/graphviz/bin`. The used Graphviz version is:

- **Graphviz 2.38.0** for the **Heroku-16** stack (Ubuntu 16.04 LTS)
- **Graphviz 2.36.0** for the **Cedar-14** stack (Ubuntu 14.04 LTS)

The directory `/app/graphviz/bin` is added to the `PATH`. Furthermore, the buildpack sets the environment variable `GRAPHVIZ_DOT` to `/app/graphviz/bin/dot` (required by some tools, e.g. PlantUML).

The binaries are taken from the official Ubuntu packages:

- <http://packages.ubuntu.com/xenial/graphviz> for Heroku-16
- <http://packages.ubuntu.com/trusty/graphviz> for Cedar-14 


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
