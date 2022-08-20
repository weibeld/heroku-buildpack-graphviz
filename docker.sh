#!/bin/bash

if [[ "$#" -ne 1 || ("$1" != 18 && "$1" != 20 && "$1" != 22) ]]; then
  echo -e "USAGE\n  $(basename $0) STACK\n\nARGUMENTS\n  STACK  Heroku stack (must be 18, 20, or 22)"
  exit 1
fi

docker run -ti --rm -v $(pwd):/app -e STACK=heroku-"$1" heroku/heroku:"$1"
