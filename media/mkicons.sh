#!/usr/bin/env bash

if [[ -z "$@" ]]; then
  ansii --red --newline "Input file missing"
  exit 1
fi

source $HOME/bash-utils/libs/basefilename.sh

SOURCE=$1
bname=$(bfn_base "$SOURCE")
# NEW! Linux way (with and npm - svgexport)
convert -density 1200 -resize 16x16 "${SOURCE}" "${bname}"_16.png 
convert -density 1200 -resize 32x32 "${SOURCE}" "${bname}"_32.png 
convert -density 1200 -resize 48x48 "${SOURCE}" "${bname}"_48.png 
convert -density 1200 -resize 64x64 "${SOURCE}" "${bname}"_64.png 
convert -density 1200 -resize 96x96 "${SOURCE}" "${bname}"_96.png 
convert -density 1200 -resize 128x128 "${SOURCE}" "${bname}"_128.png 
convert -density 1200 -resize 192x192 "${SOURCE}" "${bname}"_192.png 
convert -density 1200 -resize 256x256 "${SOURCE}" "${bname}"_256.png 
convert -density 1200 -resize 512x512 "${SOURCE}" "${bname}"_512.png 
# Simpler way to do it
icotool -c -o "${bname}.ico" "${bname}"_{16,32,48,64,96,128,192,256,512}.png
# Make the OSX icns
png2icns ${bname}.icns ${bname}_{16,32,48,128,192,256}.png
# Move png files to _backup
mkdir _backup && mv "${bname}"_{16,32,48,64,96,128,192,256,512}.png "_backup/"

exit 0
