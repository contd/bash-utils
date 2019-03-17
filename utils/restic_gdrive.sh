#!/usr/bin/env bash

export RESTIC_PASSWORD=$(cat ~/.config/restic/restic_password)
export RESTIC_REPOSITORY=gdrive:backups

# LOGFILE=~/.local/logs/restic_gdrive_back-history-$(date "+%Y-%m").log
# echo "=========================================================================" >> $LOGFILE
# echo "Started: $(date)" >> $LOGFILE

RCLONE_VERBOSE=2
restic -o rclone.program="/usr/bin/rclone" \
  -o rclone.args="serve restic --stdio --bwlimit 1M --b2-hard-delete --verbose" \
  -r rclone:${RESTIC_REPOSITORY} list snapshots

#/usr/local/bin/restic -r rclone:${RESTIC_REPOSITORY} backup /btrfs/Vaults/Documents
# /usr/local/bin/restic backup /btrfs/Vaults/Private --quiet
# /usr/local/bin/restic backup /home/jason/.gnupg --quiet
# /usr/local/bin/restic backup /home/jason/.ssh --quiet
# /usr/local/bin/restic backup /opt/apps/tor-browser_en-US --quiet
# /usr/local/bin/restic backup /data/home/Mail --quiet
# /usr/local/bin/restic backup /data/home/.mozilla --quiet
# /usr/local/bin/restic backup /data/home/.thunderbird --quiet
# /usr/local/bin/restic backup /data/home/home-utils --quiet
# /usr/local/bin/restic backup /data/home/Arduino --quiet
# /usr/local/bin/restic backup /data/home/.aws --quiet
# /usr/local/bin/restic backup /data/home/.password-store --quiet
# /usr/local/bin/restic backup /data/home/bash-utils --quiet
# /usr/local/bin/restic backup /data/home/.offlineimap --quiet
# /usr/local/bin/restic backup /data/home/.gnupg --quiet
# /usr/local/bin/restic backup /data/home/kvm --quiet
# /usr/local/bin/restic backup /data/home/.ecs --quiet
# /usr/local/bin/restic backup /data/home/.minikube --exclude="/data/home/.minikube/cache" --quiet

# echo "Finished: $(date)" >> $LOGFILE

unset RESTIC_PASSWORD
unset RESTIC_REPOSITORY

exit 0
