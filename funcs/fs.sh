#! /usr/bin/env bash

#
# lv
#
function lv
{
	__LS_PATH=`pwd`

	if [ ! -z "$1" ];then
    __LS_PATH=$1
  fi

	for i in ${__LS_PATH}/*;do
		bname=$(basename $i)
    echo "$bname"
	done
}
#
# lv
#
function lvc
{
	__LS_PATH=`pwd`

	if [ ! -z "$1" ];then
    __LS_PATH=$1
  fi

	for i in ${__LS_PATH}/*;do
		bname=$(basename $i)

		if [ -d "$i" ];then
			ansi --blue --newline "$bname"
		else
			ansi --green --newline "$bname"
		fi
	done
}
#
# purge_adb
#
function purge_adb
{
  # Purges .AppleDouble files recursively from current path
  CLOC=`pwd`
  ansii --green --newline "Purging .AppleDouble files from here: $CLOC"
  ansii --yellow --newline "================================================================="
  find $CLOC -name .AppleDouble* -exec rm -rf {} \;
}
#
# purge_ds
#
function purge_ds
{
	# Purges .DS_Store files recursively from current path
  CLOC=`pwd`
  ansii --green --newline "Purging .DS_Store and ._.DS_Store files from here: $CLOC"
  ansii --yellow --newline "================================================================="

  find $CLOC -name .DS_Store -exec rm -f {} \;
  find $CLOC -name ._.DS_Store -exec rm -f {} \;
}
#
# top10
#
function top10
{
    loc=$(pwd)
    du -a $loc/* | sort -n -r | head -n 10
}
