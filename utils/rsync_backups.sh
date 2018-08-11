#!/usr/bin/env bash

if [ "`ping -c 1 hugo`" ];then
	rsync -a --delete-before /data/Library/ hugo:/data/svol/Library/
	rsync -a --delete-before /data/Media/ hugo:/data/svol/Media/
	rsync -a --delete-before /data/Training_Resources/ hugo:/data/svol/Training_Resources/
	rsync -a --delete-before /data/home/ hugo:/data/svol/home/
fi

exit 0
