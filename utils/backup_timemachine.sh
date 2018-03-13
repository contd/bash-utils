#!/usr/bin/env bash

date=`date "+%Y-%m-%d_%H-%M-%S"`
HOME=/home/jason/
BDIR=/export/GREENNFS/backups/laptop

rsync -az --delete --delete-excluded --info=progress2 \
  --exclude-from=$HOME/.config/backup/excludes \
  --link-dest=$BDIR/current \
  $HOME \
  root@lacie:$BDIR/incomplete_back-$date && \
  ssh root@lacie \
  "mv $BDIR/incomplete_back-$date $BDIR/back-$date && \
   rm -f $BDIR/current && \
   ln -s $BDIR/back-$date $BDIR/current"

exit 0
