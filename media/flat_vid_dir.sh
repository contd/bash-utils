#!/usr/bin/env bash

if [ "$#" -le "0" ];then
	ansii --red --newline "You need to give the path to the dir where the new videos are to flatten its dir structure"
	exit 1
fi

BDIR=`pwd`

VDIR=$1
cd $VDIR/
rename 's/ /_/g' *

for i in *;do
	if [ -d "$i" ];then
		fname=$(basename "$i")
		NUM=$(echo "$i" | awk -F'[_.]' '{print $1}')
		cd "$i/"
		rename 's/ /_/g' *.mp4
		for j in *.mp4;do
			bname=$(basename "$j")
			nname="${NUM}_${bname}"
			mv $bname $nname && mv $nname ../
		done
		cd ../
		rm -rf "$i"
	fi
done

cd "$BDIR/"

exit 0
