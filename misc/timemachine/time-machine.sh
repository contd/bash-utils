#!/usr/bin/env bash

function time-machine
{
	if [ "$@#" le "0" ];then
		ansii --yellow --newline "Usage: time-machine [users|system|other]"
		return
	fi
	ansii --green --newline "Not Implemented, for reference on how to run your own"
	ansii --green --newline "backup system like Apple's Time Machine."
	
}

function tm_users
{
	BTYPE=users
	BSRC=$HOME/

	date=`date "+%Y-%m-%d_%H_%M_%S"`
	BDISK=/Volumes/2TBACK1
	BPATH=$BDISK/macbookpro/$BTYPE
	EXCLUDES=./excludes/$BTYPE

	rsync -azx --delete --delete-excluded --info=progress2 \
		--exclude-from=$EXCLUDES \
		--link-dest=$BPATH/current $BSRC $BPATH/incomplete_back

	mv $BPATH/incomplete_back $BPATH/back-$date
	rm -f $BPATH/current
	ln -s $BPATH/back-$date $BPATH/current
}

function tm_system
{
	BTYPE=system
	BSRC=/

	date=`date "+%Y-%m-%d_%H_%M_%S"`
	BDISK=/Volumes/2TBACK1
	BPATH=$BDISK/macbookpro/$BTYPE
	EXCLUDES=./excludes/$BTYPE

	rsync -azx --delete --delete-excluded --info=progress2 \
		--exclude-from=$EXCLUDES \
		--link-dest=$BPATH/current $BSRC $BPATH/incomplete_back

	mv $BPATH/incomplete_back $BPATH/back-$date
	rm -f $BPATH/current
	ln -s $BPATH/back-$date $BPATH/current
}

function tm_1tbmin
{
	BTYPE=1tbmin
	BSRC=/Volumes/1TBMIN/

	date=`date "+%Y-%m-%d_%H_%M_%S"`
	BDISK=root@192.168.200.2:/lvols/vol02/backups
	BPATH=$BDISK/macbookpro/$BTYPE
	EXCLUDES=../excludes/$BTYPE

	rsync -azx --delete --delete-excluded --info=progress2 \
		--exclude-from=$EXCLUDES \
		--link-dest=$BPATH/current $BSRC $BPATH/incomplete_back

	mv $BPATH/incomplete_back $BPATH/back-$date
	rm $BPATH/current
	ln -s $BPATH/back-$date $BPATH/current
}

function tm_template
{
	BSRC=/

	date=`date "+%Y-%m-%d_%H_%M_%S"`
	BDISK=/Volumes/Public
	BPATH=$BDISK/hackintosh/HSSD
	EXCLUDES=../excludes/default

	rsync -az -m --safe-links --one-file-system --delete --delete-excluded --info=progress2 --bwlimit=5120 \
		--exclude-from=$EXCLUDES --link-dest=$BPATH/current $BSRC $BPATH/incomplete_back

	mv $BPATH/incomplete_back $BPATH/back-$date
	rm -f $BPATH/current
	ln -s $BPATH/back-$date $BPATH/current
}
