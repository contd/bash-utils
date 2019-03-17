#!/usr/bin/env bash

if [[ -z "$@" ]]; then
  ansii --red --newline "Input file missing"
  exit 1
fi

source $HOME/bash-utils/libs/basefilename.sh

SOURCE=$1
BNAME=$(bfn_base "$SOURCE")
mkdir $BNAME && mv $SOURCE $BNAME/ && cd $BNAME/

for XY in 16 32 48 64 96 128 192 256 512
do
	convert -density 1200 -resize ${XY}x${XY} "${SOURCE}" "${BNAME}_${XY}.png"
done

icotool -c -o "${BNAME}.ico" "${BNAME}"_{16,32,64,128,256}.png
png2icns ${BNAME}.icns ${BNAME}_{16,32,48,128,192,256}.png

exit 0
