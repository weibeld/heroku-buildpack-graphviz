Heroku Buildpack: Graphviz (-deb)
=================================

Install [Graphviz](http://www.graphviz.org/) on Heroku.

Graphviz is installed as a Debian package.


Usage
-----

This buildpack is intended to be used in combination with other buildpacks by the means of [heroku-buildpack-multi](
https://github.com/ddollar/heroku-buildpack-multi). For example, to add Graphviz support to a Ruby on Rails app:

    $ heroku config:set BUILDPACK_URL=https://github.com/ddollar/heroku-buildpack-multi.git

    $ cat .buildpacks
    https://github.com/heroku/heroku-buildpack-ruby.git
    https://github.com/weibeld/heroku-buildpack-graphviz-src.git

    $ git push heroku master

This incorporates the `graphviz` Debian package in your application release.


Relation with heroku-buildpack-graphviz-src
-------------------------------------------

There's a related buildpack [heroku-buildpack-graphviz-src](https://github.com/weibeld/heroku-buildpack-graphviz-src). It differs in that it installs Graphviz not as a Debian package, but from the source code.

Pro/contra -deb &#8594; -src
-------------------------------------

Pro:
* Fully functional, all output formats are available

Contra:
* Old Graphviz version
  * Currently, version 2.20.2 from 2008 (see [http://www.graphviz.org/pub/graphviz/stable/SOURCES/](http://www.graphviz.org/pub/graphviz/stable/SOURCES/) and [http://packages.ubuntu.com/lucid/graphviz](http://packages.ubuntu.com/lucid/graphviz)). This is the version in the `graphviz` package for Ubuntu 10.04 LTS (Lucid Lynx), which is currently running on Heroku.
  * However, assuming that Heroku will upgrade soon to Ubuntu 14.04 LTS, this "problem" will resolve itself in the near future.
* Generally less flexibility with Graphviz versions


License
-------

Licensed under the MIT License. See [LICENSE.md](LICENSE.md) file.

