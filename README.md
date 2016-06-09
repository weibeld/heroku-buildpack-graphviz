Heroku Buildpack: Graphviz
===========================

Install [Graphviz](http://www.graphviz.org/) on Heroku.


Description
-----------

This buildpack installs the Graphviz binaries to `/app/graphviz/bin`. The used Graphviz version is:

* Graphviz 2.36.0 for stack Cedar-14
* Graphviz 2.20.2 for stack Cedar *(deprecated stack)*

The `/app/graphviz/bin` directory is added to the `PATH`. The variable `GRAPHVIZ_DOT` is set to `/app/graphviz/bin/dot` (required by some tools, e.g. PlantUML).

The binaries are taken from the official Ubuntu packages: <http://packages.ubuntu.com/trusty/graphviz> for Cedar-14 (Ubuntu 14.04 LTS), and <http://packages.ubuntu.com/lucid/graphviz> for Cedar (Ubuntu 10.04 LTS).


Usage
-----

Simply do:

~~~bash
heroku buildpacks:set https://github.com/weibeld/heroku-buildpack-graphviz.git
~~~

On the next `git push heroku master`, the Graphviz buildpack will be used.

For more information on how to use custom buildpacks, see <https://devcenter.heroku.com/articles/third-party-buildpacks#using-a-custom-buildpack>.


Usage together with other buildpacks
------------------------------------

You can use multiple buildpacks at the same time as described on [https://devcenter.heroku.com/articles/using-multiple-buildpacks-for-an-app](
https://devcenter.heroku.com/articles/using-multiple-buildpacks-for-an-app):

~~~bash
heroku buildpacks:add --index 1 heroku/ruby
heroku buildpacks:add --index 2 https://github.com/weibeld/heroku-buildpack-graphviz.git
~~~

You can always check which buildpacks you have currently added to your app with:

~~~bash
heroku buildpacks
~~~


Verification
------------

Verify the installation of Graphviz on Heroku with:

~~~bash
heroku run dot -V
~~~


License
-------

Licensed under the MIT License. See [LICENSE.md](LICENSE.md) file.
