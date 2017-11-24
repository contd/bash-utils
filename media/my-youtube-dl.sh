#!/usr/bin/env bash

if [ "$#" -le "0" ];then
  echo "You need to pass in the url or id of the YouTube video or playlist to download."
else
	VURL=$1
	id=$(youtube-dl --id --get-filename $VURL)
	bid=$(basename $id)
	VEXT="${bid##*.}"
	YTID=${bid%.*}

	ansi --yellow --newline "==================================================================================="
	ansi --green --newline  "Downloading ${VURL}"
	ansi --green --newline  " [Id: ${id} | Bid: ${bid} | Ext: ${VEXT} | YTID: ${YTID} ]"
	ansi --yellow --newline "==================================================================================="

  youtube-dl --restrict-filenames --write-thumb --write-sub $VURL

  rename "s/-$YTID//" *.*
fi

exit 0
