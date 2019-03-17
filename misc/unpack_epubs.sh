#!/usr/bin/env bash

echo "Removing spaces from filenames..."
rename 's/ /_/g' *.epub
mkdir epub
cp *.epub epub/
rename 's/\.epub/\.zip/' *.epub
ls *.zip|awk -F'.zip' '{print "unzip "$0" -d "$1}' | sh

exit 0
