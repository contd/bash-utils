#!/usr/bin/env bash

function _show_example
{
  echo ""
  ansii --green --newline "Example 1: gen-gallery . /var/www/videos/newgallery NewGallery";
  ansii --green --newline "Example 2: gen-gallery ./ /var/www/videos/egghead Egghead";
  ansii --green --newline "Example 3: gen-gallery /Volumes/1TBMIN/GLibrary/Movies/Lynda.com/ /var/www/videos/lynda \"Lynda Gallery\""
  echo ""
}

if [ "$#" -lt 3 ]; then
  _show_example
  exit 1
fi

INDIR=$1
OUDIR=$2
TITLE=$3

if [ -z "$INDIR" ];then
  echo ""
  ansii --red --newline "Need to pass the dir where videos are located!"
  _show_example
  exit 1
fi
if [ -z "$OUDIR" ];then
  echo ""
  ansii --red --newline "Need to pass the dir where the album will live!"
  _show_example
  exit 1
fi
if [ -z "$TITLE" ];then
  echo ""
  ansii --red --newline "Need to pass the album title!"
  _show_example
  exit 1
fi

ansii --green --newline "Creating Gallery: $TITLE "
ansii --green --newline "From files in: $INDIR "
ansii --green --newline "Will be located: $OUDIR "
echo ""

thumbsup --input $INDIR --output $OUDIR --title $TITLE --thumb-size 220 --original-photos true --original-videos true --original-videos true --sort-folders "name"

exit 0
