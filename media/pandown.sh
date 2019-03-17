#!/usr/bin/env bash

#
# pandown
#
function pandown
{
	if [ "$#" -le "0" ];then
		echo "You need to give the file or url to convert to markdown and epub."
	else
		URL=$1
		fname=$(basename $1)
		bname=${fname%.*}

		STD_FMT="--wrap=none --ascii --smart "
		MD_FMT="${STD_FMT} --atx-headers "

		if [ "$#" -ge "2" ] && [ "$2" = "epub" ];then
			pandoc -f html $1 -t epub3 $STD_FMT -o $bname.epub
		else
			pandoc -f html $1 -t markdown_strict $MD_FMT -o $bname.md
		fi
	fi
}
#
# recur
#
function recur
{
	if "$#" -le "0" ];then
		__BASE_DIR=`pwd`/
	else
		__BASE_DIR=$1
	fi
	echo "Running pandown on all epub files in: ${__BASE_DIR}"
	for i in ${__BASE_DIR}/*.epub;do
		pandown "$i"
	done
}
#
# multi
#
function multi
{
	if [ "$#" -le "0" ];then
		echo "Need to speficy a file of urls to process."
		return 1
	else
		FILENAME=`pwd`/$1
		while IFS= read -r line
		do
			pandown "$line"
		done < $FILENAME

		return 0
	fi
  return 0
}

if [[ $1 == "recur" ]]; then
  recur $@
  exit 0
elif [[ "$1" != "multi" ]];then
  multi $@
  exit 0
else
  pandown $@
  exit 0
fi
