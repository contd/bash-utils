#!/usr/bin/env bash

if [[ "$1" == "--help" ]] || [[ "$1" == "-h" ]]; then
	echo "Usage $0"
	echo "Usage $0 INFO"
	echo "Usage $0 SHOW"
	echo "Usage $0 VERB"
	exit 0
fi

date=`date "+%Y-%m-%d_%H-%M-%S"`
BSRC=/home/jason/
BDIR=jason@lacie::backups/laptop
EXCL=/data/exclude_file
OPTS=""

if [[ "$1" == "INFO" ]]; then
	ansi --green "Source:  $BSRC"
	ansi --green "Destin: $BDIR"
	ansi --green "Exclude: $EXCL"
	ansi --blue "==============================================================="
	cat $EXCL;echo "";exit 0
fi

if [[ "$1" == "VERB" ]];then OPTS="--info=progress2";fi

EXCMD=$(cat <<EOF
rsync -az --delete --delete-excluded --exclude-from=$EXCL $OPTS \ 
  --link-dest=$BDIR/current $BSRC $BDIR/incomplete_back-$date \
	&& mv /lacie/backups/laptop/incomplete_back-$date /lacie/backups/laptop/back-$date \
	&& rm -f /lacie/backups/laptop/current \
	&& ln -s /lacie/backups/laptop/back-$date /lacie/backups/laptop/current
EOF
)

if [[ $1 == "SHOW " ]];then echo $EXCMD;exit 0;fi

if [[ ! -d "/lacie/backups/laptop/full" ]]; then
	ansi --cyan "Running for first time?"
	ansi --green "Just manually run: "
	ansi --yellow "rsync -a --info=progress2 --exclude-from=$EXCL $BSRC $BDIR/full"
  ansi --cyan --no-newline "then: ";ansi --yellow "ln -s /lacie/backups/laptop/full /lacie/backups/laptop/current"
else
	ansi --green "Running: "
	ansi --yellow $EXCMD
	#rsync -az --delete --delete-excluded --exclude-from=$EXCL $OPTS \
	#	--link-dest=$BDIR/current $BSRC $BDIR/incomplete_back-$date \
	#  && mv /lacie/backups/laptop/incomplete_back-$date /lacie/backups/laptop/back-$date \
	#  && rm -f /lacie/backups/laptop/current && ln -s /lacie/backups/laptop/back-$date /lacie/backups/laptop/current
fi

exit 0
