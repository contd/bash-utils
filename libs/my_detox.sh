#!/usr/bin/env bash

#
# my_detox
#
function my_detox
{
	EXT=$1
	if [ "$#" -le "0" ];then
		echo "Need to give a file extension so it gets preserved when renaming files."
		return 1
	else
		# If its a directory you don't need to worry about the extension.
		rename 's/ /_/g' *.{$EXT}
		for i in *.${EXT};do
			sname=$(basename $i)
			bname=${sname%.*}
			PRE_TR_NAME=$(echo $bname | tr '_' ' ' | tr -d '[:punct:]' | tr ' ' '_')
			NEW_TR_NAME="${PRE_TR_NAME}.${EXT}"
			if [ "${i}" != "${NEW_TR_NAME}" ];then
				mv "${i}" "${NEW_TR_NAME}"
			fi
		done
	fi
}
