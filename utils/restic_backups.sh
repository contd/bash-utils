#!/usr/bin/env bash

export RESTIC_PASSWORD=$(cat ~/.config/restic/restic_password)
B2_ACCOUNT_ID=61bb4f75d194
B2_ACCOUNT_KEY=0017d90f6a1ae2c4001b205ec64e8581e3a5b3ec27
RESTIC_REPOSITORY=b2:jasonlaptop-backup

#restic backup /home/jason/Library/Important --quiet
#restic backup /home/jason/Library/Locker --quiet
restic backup /home/jason/Documents --quiet
restic backup /home/jason/.gnupg --quiet
restic backup /home/jason/.ssh --quiet
#restic backup /data/docker --quiet
restic backup /data/Mail --quiet
restic backup /opt/apps/tor-browser_en-US --quiet

if [ "`ping -c 1 lacie`" ];then
	#RESTIC_REPOSITORY="sftp:jason@lacie:/export/GREENFS/Library"
	#restic backup /data/Library/ --quiet
	#RESTIC_REPOSITORY="sftp:jason@lacie:/export/GREENFS/Media"
	#restic backup /data/Media/ --quiet
	RESTIC_REPOSITORY="sftp:jason@lacie:/export/GREENFS/backups/home"
	restic backup /home/jason/ --exclude-file=/data/exclude_file --one-file-system --quiet
	restic backup /data/home/ --exclude=/data/home/develop --quiet
	#restic backup /home/Private/Art/ --quiet
	restic backup /opt/apps/tor-browser_en-US/ --quiet
	#RESTIC_REPOSITORY="sftp:jason@lacie:/export/GREENFS/backups/develop"
	#restic backup /data/home/develop/ --quiet
fi

unset RESTIC_PASSWORD

exit 0
