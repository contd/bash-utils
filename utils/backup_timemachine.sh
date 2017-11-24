#!/usr/bin/env bash

date=`date "+%Y-%m-%d_%H-%M-%S"`
HOME=/home/jason/
BDIR=/data/vol1/backups

rsync -az --delete --delete-excluded \
  --exclude-from=$HOME/.config/backup/excludes \
  --link-dest=$BDIR/current \
  $HOME \
  jason@hugo:$BDIR/incomplete_back-$date && \
  ssh jason@hugo \
  "mv $BDIR/incomplete_back-$date $BDIR/back-$date && \
   rm -f $BDIR/current && \
   ln -s $BDIR/back-$date $BDIR/current"

exit 0
