#!/bin/bash


BUPATH=/Volumes/Public/macbook-pro-backup

# now arguments say what we are backing up
if [ "$#" -eq 0 ]; then
  BFPATHS=( / )
else
  BFPATHS=( "$@" )
fi

date=`date "+%Y-%m-%d_%H_%M_%S"`
#date=`date "+%Y-%m-%dT%H_%M_%S"`

echo "Need to create dir!!!!"

for BFPTH in ${BFPATHS[*]}
do
  if [ ! -d "$BUPATH$BFPTH" ]; then
    mkdir -p $BUPATH$BFPTH
  fi
  echo "---------------------------------------------------------"
  echo " --------  Syncing up: $BFPTH to $BUPATH$BFPTH  -------- "
  echo "---------------------------------------------------------"
  rsync -a --info=progress2 \
        --exclude=.Trash* --exclude=.DS_Store \
        --exclude=Users --exclude=Volumes \
        --exclude=cores --exclude=dev \
        --exclude=net --exclude=tmp \
        --exclude=.Trash* --exclude=.DS_Store \
	$BFPTH $BUPATH$BFPTH

  echo " Last run: $date " >> $BUPATH/rsync_log.txt
  echo "---------------------------------------------------------"
  echo "      FINISHED!!! " 
  echo "---------------------------------------------------------"

  # Sylinks wont work on windows mounted drive destination, but
  # could try it on the Lacie
	#--link-dest=$BUPATH/current $BFPTH $BUPATH/back-$date
  #rm -f $BUPATH/current
  #ln -s $BUPATH/back-$date $BUPATH/current
done

