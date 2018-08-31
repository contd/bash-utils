#!/usr/bin/env bash

if [ "`ping -c 1 lacie`" ];then
	export RESTIC_PASSWORD=$(cat ~/.config/restic/restic_password)
	export RESTIC_REPOSITORY="sftp:jason@lacie:/export/GREENFS/backups"

	restic backup /home/jason --exclude-file="/data/exclude_file" --one-file-system --quiet
	restic backup --exclude="Qt" --exclude="restore" /data --quiet
	restic backup /opt/apps/tor-browser_en-US --quiet

	unset RESTIC_PASSWORD
	unset RESTIC_REPOSITORY
fi

exit 0
