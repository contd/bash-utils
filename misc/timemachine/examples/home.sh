#!/bin/bash


BUPATH=/Volumes/SABERBIG/backups/tmach

# now arguments say what we are backing up
if [ "$#" -eq 0 ]; then
  #BFPATHS=( /Users/kumpfjn /usr/local )
  # Lets start small since its over the network
  BFPATHS=( /Users/kumpfjn/ )
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
  #rsync -aP --exclude=Applications* --exclude=perl5 --exclude=.Trash --exclude=.DS_Store --exclude=.cpan \
  rsync -a --info=progress2 \
        --exclude=Applications* --exclude=.rbenv \
        --exclude=perl5 --exclude=.Trash --exclude=.DS_Store --exclude=.cpan \
        --exclude=Pictures --exclude=Music --exclude=Win7_* \
	$BFPTH $BUPATH$BFPTH
        #--exclude=Music --exclude=Win7_* \
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

