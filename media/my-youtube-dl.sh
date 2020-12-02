#!/usr/bin/env bash

if [ "$#" -le "0" ];then
  echo "You need to pass in the url or id of the YouTube video or playlist to download."
else
	VURL=$1

	ansi --yellow "==================================================================================="
	ansi --green  "Downloading ${VURL}"
	ansi --yellow "==================================================================================="

  #youtube-dl --restrict-filenames --write-thumb --write-sub $VURL
	#youtube-dl --restrict-filenames -o '%(playlist_index)s_%(title)s.%(ext)s' $VURL
	youtube-dl --restrict-filenames -o '%(title)s.%(ext)s' $VURL
fi

exit 0
