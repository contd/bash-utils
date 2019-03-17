#!/usr/bin/env bash

export RESTIC_PASSWORD=$(cat ~/.config/restic/restic_password)
export B2_ACCOUNT_ID=61bb4f75d194
export B2_ACCOUNT_KEY=0017d90f6a1ae2c4001b205ec64e8581e3a5b3ec27
export RESTIC_REPOSITORY=b2:jasonlaptop-backup

LOGFILE=~/.local/logs/restic_b2back-history-$(date "+%Y-%m").log
echo "=========================================================================" >> $LOGFILE
echo "Started: $(date)" >> $LOGFILE

/usr/local/bin/restic backup /btrfs/Vaults/Documents --quiet
/usr/local/bin/restic backup /btrfs/Vaults/Private --quiet
/usr/local/bin/restic backup /home/jason/.gnupg --quiet
/usr/local/bin/restic backup /home/jason/.ssh --quiet
/usr/local/bin/restic backup /opt/apps/tor-browser_en-US --quiet
/usr/local/bin/restic backup /data/home/Mail --quiet
/usr/local/bin/restic backup /data/home/.mozilla --quiet
/usr/local/bin/restic backup /data/home/.thunderbird --quiet
/usr/local/bin/restic backup /data/home/home-utils --quiet
/usr/local/bin/restic backup /data/home/Arduino --quiet
/usr/local/bin/restic backup /data/home/.aws --quiet
/usr/local/bin/restic backup /data/home/.password-store --quiet
/usr/local/bin/restic backup /data/home/bash-utils --quiet
/usr/local/bin/restic backup /data/home/.offlineimap --quiet
/usr/local/bin/restic backup /data/home/.gnupg --quiet
/usr/local/bin/restic backup /data/home/kvm --quiet
/usr/local/bin/restic backup /data/home/.ecs --quiet
/usr/local/bin/restic backup /data/home/.minikube --exclude="/data/home/.minikube/cache" --quiet

echo "Finished: $(date)" >> $LOGFILE

unset RESTIC_PASSWORD
unset RESTIC_REPOSITORY
unset B2_ACCOUNT_ID
unset B2_ACCOUNT_KEY

exit 0
