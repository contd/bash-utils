#!/bin/sh

date=`date "+%Y-%m-%dT%H_%M_%S"`
HOME=/home/user/

rsync -azP --delete --delete-excluded --exclude-from=$HOME/.rsync/exclude \
  --link-dest=../current $HOME user@backupserver:Backups/incomplete_back-$date \
  && ssh user@backupserver \
  "mv Backups/incomplete_back-$date Backups/back-$date \
  && rm -f Backups/current \
  && ln -s back-$date Backups/current"
