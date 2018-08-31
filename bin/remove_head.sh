#!/usr/bin/env bash

if [ -z $1 ];then
  echo "Usage: $0 2,3 ext"
  return
elif [ -z $2 ];then
  echo "Usage: $0 2,5 md"
  return
else
  echo "Removing lines: $1 from files: *.$2"
  echo "Using: sed -i\".bak\" \"${1}d\" *.$2"
  #echo "This is used to remove lines n to m from files"
  for i in *.$2; do
      #sed -i".bak" '2d' $i
      echo "Fixing: $i"
      sed -i".bak" "${1}d" $i
  done
fi

exit 0