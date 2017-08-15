#!/usr/bin/env bash

if [[ -z "$@" ]]; then
  echo "Missging path of svg icons and path to put png icons."
else
  if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Missging path of svg icons and path to put png icons."
  else
    for i in $1/*; do
      bname=$(bfn_base "$i")
      echo "convert -background none -size 512x512 $i $2/${bname}.png"
      convert -background none -size 512x512 $i $2/$bname.png
      #echo "svgexport  $i $2/$filename.png 512:512"
      #svgexport  $i $2/$filename.png 512:512
    done
  fi
fi

exit 0
