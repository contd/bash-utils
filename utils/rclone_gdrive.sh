#!/usr/bin/env bash

LOGFILE=~/.local/logs/rclone_gdrive-history-$(date "+%Y-%m").log
echo "=========================================================================" >> $LOGFILE
echo "Started: $(date)" >> $LOGFILE

/usr/local/bin/rclone sync /Users/jason/Google\ Drive GoogleDrive: --bwlimit 150

echo "Finished: $(date)" >> $LOGFILE

exit 0
