#!/usr/bin/env bash

pushd `pwd`/

if [[ -z "$1" ]];then
	ansi --red "Need to specify a video file."
	exit 1
fi

if [[ -z "$2" ]];then
	ansi --yellow "Need to specify an image name"
	edit 1
fi

VIDEOFILE=$1
IMAGENAME=$2

ansi --green "Video File: ${VIDEOFILE}"
ansi --cyan "Image Basename: ${IMAGENAME}"

ffmpeg -i ${VIDEOFILE} -r 10 -q:v 2 -f image2 ${IMAGENAME}-%4d.jpg

for i in $IMAGENAME-*.jpg;do
	BNAME=${i%.*}
	convert $i $BNAME.gif
done

popd

exit 0
