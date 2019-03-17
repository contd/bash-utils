#!/usr/bin/env bash

pushd `pwd`/

if [[ "$#" -lt 1 ]];then
	ansi --red "Need to specify animation file name."
	exit 1
fi

VIDEO_IN=$1
VIDEO_BN=${VIDEO_IN%.*}

gifsicle --delay=0 --loop *.gif > ${VIDEO_BN}.gif
#ffmpeg -i "${VIDEO_IN}" -s 886x458 -pix_fmt rgb24 -r 15 -f gif - | gifsicle --optimize=3 --delay=3 > "${VIDEO_BN}.gif"

popd

exit 0
