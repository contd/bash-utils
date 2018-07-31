#!/usr/bin/env bash

if [[ "$1" == "--help" ]] || [[ "$1" == "-h" ]]; then
	echo "Usage $0"
	echo "Usage $0 INFO"
	echo "Usage $0 VERB"
	echo "Usage $0 /home/user"
	echo "Usage $0 /home/user /backupdir"
	echo "Usage $0 /home/user /backupdir /exclude_file"
	exit 0
fi

date=`date "+%Y-%m-%d_%H-%M-%S"`
BSRC=/home/jason/
BDIR=/data/backups
EXCL=/data/exclude_file
OPTS=""

if [[ "$1" == "INFO" ]]; then
	echo "Source:  $BSRC"
	echo "Backups: $BDIR"
	echo "Excludes: $EXCL"
	echo "==============================================================="
	cat $EXCL
	echo ""
	exit 0
fi
if [[ "$1" == "VERB" ]]; then
	OPTS=" --info=progress2"
elif [[ ! -z "$1" ]]; then 
	BSRC="$1" 
	if [[ ! -z "$2" ]]; then BDIR="$2"; fi
	if [[ ! -z "$3" ]]; then EXCL="$3"; fi
fi

EXCMD=`cat <<EOF
rsync -az --delete --delete-excluded --exclude-from=$EXCL \
	$OPTS --link-dest=$BDIR/current $BSRC $BDIR/incomplete_back-$date && \
mv $BDIR/incomplete_back-$date $BDIR/back-$date && \
rm -f $BDIR/current && \
ln -s $BDIR/back-$date $BDIR/current
EOF
`
#echo $EXCMD
#`$EXCMD`
if [[ -z "$BDIR/current" ]]; then
	echo "Running for first time?"
	echo "Just manually run, then: ln -s /backup_path/<backup_you_just_ran_dir> /backup_path/current"
	#rsync -az --delete --delete-excluded --exclude-from=$EXCL \
	#    $OPTS $BSRC $BDIR/incomplete_back-$date && \
	#ln -s $BDIR/back-$date $BDIR/current
else
	rsync -az --delete --delete-excluded --exclude-from=$EXCL \
	    $OPTS --link-dest=$BDIR/current $BSRC $BDIR/incomplete_back-$date && \
	mv $BDIR/incomplete_back-$date $BDIR/back-$date && \
	rm -f $BDIR/current && \
	ln -s $BDIR/back-$date $BDIR/current
fi

exit 0
