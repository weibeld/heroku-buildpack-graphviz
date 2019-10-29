#!/bin/bash

if [[ "$#" -ne 1 || ("$1" != 16 && "$1" != 18) ]]; then
  echo -e "USAGE\n  $(basename $0) STACK\n\nARGUMENTS\n  STACK  Heroku stack (must be 16 or 18)"
  exit 1
fi

docker run -ti --rm -v $(pwd):/app -e STACK=heroku-"$1" heroku/heroku:"$1"
