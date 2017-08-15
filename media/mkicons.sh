#!/usr/bin/env bash

if [[ -z "$@" ]]; then
  ansii --red --newline "Input file missing"
  exit 1
fi

SOURCE=$1
bname=$(bfn_base "$1")
# NEW! Linux way (with and npm - svgexport)
svgexport "${SOURCE}" "${bname}"_16.png 16:16
svgexport "${SOURCE}" "${bname}"_32.png 32:32
svgexport "${SOURCE}" "${bname}"_48.png 48:48
svgexport "${SOURCE}" "${bname}"_64.png 64:64
svgexport "${SOURCE}" "${bname}"_96.png 96:96
svgexport "${SOURCE}" "${bname}"_128.png 128:128
svgexport "${SOURCE}" "${bname}"_192.png 192:192
svgexport "${SOURCE}" "${bname}"_256.png 256:256
svgexport "${SOURCE}" "${bname}"_512.png 512:512
# Simpler way to do it
icotool -c -o "${bname}.ico" "${bname}"_{16,32,48,64,96,128,192,256,512}.png
# Make the OSX icns
png2icns ${bname}.icns ${bname}_{16,32,48,128,192,256}.png
# Move png files to _backup
mkdir _backup && mv "${bname}"_{16,32,48,64,96,128,192,256,512}.png "_backup/"

# Old way on a Mac
#
#mkdir $bname.iconset
#sips -z 16 16   $1 --out $bname.iconset/icon_16x16.png
#sips -z 32 32   $1 --out $bname.iconset/icon_16x16@2x.png
#sips -z 32 32   $1 --out $bname.iconset/icon_32x32.png
#sips -z 48 48   $1 --out $bname.iconset/icon_48x48.png
#sips -z 64 64   $1 --out $bname.iconset/icon_32x32@2x.png
#sips -z 64 64   $1 --out $bname.iconset/icon_64x64.png
#sips -z 128 128 $1 --out $bname.iconset/icon_128x128.png
#sips -z 256 256 $1 --out $bname.iconset/icon_128x128@2x.png
#sips -z 256 256 $1 --out $bname.iconset/icon_256x256.png
#sips -z 512 512 $1 --out $bname.iconset/icon_256x256@2x.png
#sips -z 512 512 $1 --out $bname.iconset/icon_512x512.png
#iconutil -c icns $bname.iconset
#
# Another way to do it
#convert ${bname}_icon_512.png  -bordercolor white -border 0 \
#	      \( -clone 0 -resize 16x16 \) \
#		    \( -clone 0 -resize 32x32 \) \
#		    \( -clone 0 -resize 48x48 \) \
#		    \( -clone 0 -resize 64x64 \) \
#		    \( -clone 0 -resize 128x128 \) \
#		    \( -clone 0 -resize 256x256 \) \
#		    \( -clone 0 -resize 512x512 \) \
#	      -delete 0 -alpha off -colors 256 ${bname}.ico
#
#rm -r $bname.iconset

exit 0
