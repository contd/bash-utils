#!/usr/bin/env bash


__LS_PATH=`pwd`

if [ ! -z "$1" ];then
	__LS_PATH=$1
fi

for i in ${__LS_PATH}/*;do
	bname=$(basename $i)
	echo "$bname"
done

exit 0