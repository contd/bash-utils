#!/usr/bin/env bash

if [[ -z "$1" ]]; then
  echo "Usage pascal_case <file_extension>"
  echo "Example: pascal_case svg"
  return
fi
for i in *.$1;do 
  NEW=$(echo $i  | sed -r 's/(^|_)([a-z])/\U\2/g' | tr -d '_')
  echo "mv $i $NEW"
  mv $i $NEW
done