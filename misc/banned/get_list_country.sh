#!/usr/bin/env bash

if [ $# -eq 0 ]; then
  echo "No country zone given. (i.e. ru for russia)"
  exit 1
fi

wget -O zones/$1.zone http://www.ipdeny.com/ipblocks/data/countries/$1.zone

exit 0
