#!/usr/bin/env bash

LOGFILE=~/.local/logs/restic_b2back-history-$(date "+%Y-%m").log
echo "=========================================================================" >> $LOGFILE
echo "Started: $(date)" >> $LOGFILE

if [ "`ping -c 1 lacie`" ];then
	export RESTIC_PASSWORD=$(cat ~/.config/restic/restic_password)
	export RESTIC_REPOSITORY="sftp:jason@lacie:/export/GREENFS/backups"

	restic backup /home/jason --exclude-file="/data/exclude_file" --one-file-system --quiet
	restic backup --exclude="Qt" --exclude="restore" /data --quiet
	restic backup /opt/apps/tor-browser_en-US --quiet

	unset RESTIC_PASSWORD
	unset RESTIC_REPOSITORY
else
	echo "UNABLE: lacie server not found." >> $LOGFILE
fi

echo "Finished: $(date)" >> $LOGFILE

exit 0
