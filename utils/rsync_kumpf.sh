#!/usr/bin/env bash
#
# rsync_kumpf.sh
# Copyright (C) 2020 jason <jason@Jasons-MacBook-Air.local>
#
# Distributed under terms of the MIT license.
#

LOGFILE=~/.local/logs/rsync_kumpf-history-$(date "+%Y-%m").log
echo "=========================================================================" >> $LOGFILE
echo "Started: $(date)" >> $LOGFILE

DEST="/Volumes/EXT1TB/DigitalOcean/main.kumpf.io/vol_nyc1_01/"
SRCE="jason@kumpf.io:/mnt/vol_nyc1_01/"

if [[ -d "$DEST" ]];then
	if [[ -z "$1" ]];then
		#/usr/local/bin/rsync -az --info=progress2 $SRCE $DEST
		/usr/local/bin/rsync -az $SRCE $DEST
	else
		/usr/local/bin/rsync -az $SRCE $DEST
	fi
fi

echo "Finished: $(date)" >> $LOGFILE

exit 0
