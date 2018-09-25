#!/bin/bash

set -e

if [[ "$1" = run ]]; then
  /buildpack/bin/compile /app
  source /app/.profile.d/graphviz.sh
  echo "digraph G { A -> B -> C }" | dot -Tpng > graph.png
  exit
fi

echo "Testing build on heroku-16 ..."
docker run -v `pwd`:/buildpack -e STACK=heroku-16 --rm heroku/heroku:16 /buildpack/test.sh run
echo "success!"

echo "Testing build on heroku-18 ..."
docker run -v `pwd`:/buildpack -e STACK=heroku-18 --rm heroku/heroku:18 /buildpack/test.sh run
echo "success!"
