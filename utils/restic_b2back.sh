#!/usr/bin/env bash

export RESTIC_PASSWORD=$(cat ~/.config/restic/restic_password)
export B2_ACCOUNT_ID=61bb4f75d194
export B2_ACCOUNT_KEY=0017d90f6a1ae2c4001b205ec64e8581e3a5b3ec27
export RESTIC_REPOSITORY=b2:jasonlaptop-backup

restic backup /home/jason/.gnupg --quiet
restic backup /home/jason/.ssh --quiet
restic backup /opt/apps/tor-browser_en-US --quiet
restic backup /data/home/Mail --quiet
restic backup /home/jason/Vaults/Documents --quiet
restic backup /home/jason/Vaults/Private/Locker --quiet
restic backup /home/jason/Vaults/Private/Important --quiet

unset RESTIC_PASSWORD
unset RESTIC_REPOSITORY
unset B2_ACCOUNT_ID
unset B2_ACCOUNT_KEY

exit 0
