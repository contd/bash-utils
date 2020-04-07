#!/usr/bin/env bash

LOGFILE=~/.local/logs/rclone_gdrive-history-$(date "+%Y-%m").log
echo "=========================================================================" >> $LOGFILE
echo "Started: $(date)" >> $LOGFILE

#rclone sync --progress --bwlimit=150k ~/Google\ Drive GoogleDrive:
/usr/local/bin/rclone sync /Users/jason/Google\ Drive GoogleDrive:

echo "Finished: $(date)" >> $LOGFILE

exit 0
