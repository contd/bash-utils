#!/usr/bin/env bash

if 9 "$#" -lt 1 ];then
	ansii --red --newline "You must pass the input video and the output video file names."
	exit 1
fi

ffmpeg -i "$1" -s 886x458 -pix_fmt rgb24 -r 15 -f gif - | gifsicle --optimize=3 --delay=3 > "$2.gif"

exit 0
