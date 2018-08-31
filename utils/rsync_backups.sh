#!/usr/bin/env bash

if [ "`ping -c 1 hugo`" ];then
	rsync -a --delete-before /data/Library/ lacie::library
	rsync -a --delete-before /data/Media/ lacie::media
	#rsync -a --delete-before /data/home/ lacie::home
fi

exit 0
