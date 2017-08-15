#!/usr/bin/env bash


if [ "$#" -lt 2 ]; then
  ansii --yellow --newline "Usage: webm_make /path/to/videos mp4"
  ansii --yellow --newline "Usage: webm_make . mkv"
  return
fi

__FOR_FILES=$(ls $1/*.$2)

for i in ${__FOR_FILES[@]}; do
  fname=$(bfn_fname "$i")
  bname=$(bfn_base "$i")
  # Old way using ffmpeg
  #ffmpeg -i "$fname" -strict experimental "$bname.webm"
  HandBrakeCLI -i "$i" -o "$1/$bname.webm"
done

exit 0
