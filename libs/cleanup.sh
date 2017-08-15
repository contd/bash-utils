#!/usr/bin/env bash

#
# cleanup
#
function cleanup
{
  mv *.html html/
  mv *.txt txt/
  mv *.json json/
  mv _*.md tidy/
  if [ -f _.md ]; then rm _.md; fi
  if [ -f .md ]; then rm .md; fi
  if [ -f .html ]; then rm .html; fi
  if [ -f .png ]; then rm .png; fi
  if [ -f .txt ]; then rm .txt; fi
}
