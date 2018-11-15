#!/bin/bash

set -e

if [[ "$1" = run ]]; then
  /buildpack/bin/compile /app
  source /app/.profile.d/graphviz.sh
  dot -V && exit || exit 1
fi

echo "Testing build on heroku-16..."
docker run --rm -v $(pwd):/buildpack -e STACK=heroku-16 heroku/heroku:16 /buildpack/test.sh run
echo "Success!"

echo "Testing build on heroku-18..."
docker run --rm -v $(pwd):/buildpack -e STACK=heroku-18 heroku/heroku:18 /buildpack/test.sh run
echo "Success!"
