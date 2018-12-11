#!/usr/bin/env bash

export RESTIC_PASSWORD=$(cat ~/.config/restic/restic_password)
export B2_ACCOUNT_ID=61bb4f75d194
export B2_ACCOUNT_KEY=0017d90f6a1ae2c4001b205ec64e8581e3a5b3ec27
export RESTIC_REPOSITORY=b2:jasonlaptop-backup

LOGFILE=~/.local/logs/restic_b2back-history-$(date "+%Y-%m").log
echo "=========================================================================" >> $LOGFILE
echo "Started: $(date)" >> $LOGFILE

restic backup /home/jason/.gnupg --quiet
restic backup /home/jason/.ssh --quiet
restic backup /opt/apps/tor-browser_en-US --quiet
if [[ -f ~/Vaults/Documents/feedly-2018-07-30.opml ]]; then restic backup /home/jason/Vaults/Documents --quiet;fi
if [[ -f ~/Vaults/Locker/hosts ]]; then restic backup /home/jason/Vaults/Locker --quiet;fi
restic backup /data/home/Mail --quiet
restic backup /data/home/.mozilla --quiet
restic backup /data/home/.thunderbird --quiet
restic backup /data/home/home-utils --quiet
restic backup /data/home/Arduino --quiet
restic backup /data/home/.aws --quiet
restic backup /data/home/.password-store --quiet
restic backup /data/home/bash-utils --quiet
restic backup /data/home/.offlineimap --quiet
restic backup /data/home/.gnupg --quiet
restic backup /data/home/kvm --quiet
restic backup /data/home/.ecs --quiet
restic backup /data/home/.minikube --exclude="/data/home/.minikube/cache" --quiet

echo "Finished: $(date)" >> $LOGFILE

unset RESTIC_PASSWORD
unset RESTIC_REPOSITORY
unset B2_ACCOUNT_ID
unset B2_ACCOUNT_KEY

exit 0
