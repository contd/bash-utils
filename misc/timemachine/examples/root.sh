#!/bin/bash

BUPATH=/Volumes/SABERBIG/rsync
# for root only
# only need once a day
BFPATHS=(/Applications /Library)

for BFILES in ${BFPATHS[*]}
do
  date=`date "+%Y-%m-%dT%H:%M:%S"`
  rsync -aP --link-dest=$BUPATH/backups/current $BFILES $BUPATH/backups/back-$date
  rm -f $BUPATH/backups/current
  ln -s back-$date $BUPATH/backups/current
done

