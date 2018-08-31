#!/usr/bin/env bash

#
# purge_adb
#
function purge_adb
{
  # Purges .AppleDouble files recursively from current path
  CLOC=$1
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
  CLOC=$1
  ansii --green --newline "Purging .DS_Store and ._.DS_Store files from here: $CLOC"
  ansii --yellow --newline "================================================================="

  find $CLOC -name .DS_Store -exec rm -f {} \;
  find $CLOC -name ._.DS_Store -exec rm -f {} \;
}

if [[ "$1" == "ds" ]]; then
  __LOC=`pwd`
  if [[ ! -z $2 ]]; then
    __LOC=$2
  fi
  purge_ds $__LOC
fi

if [[ "$1" == "adb" ]]; then
  __LOC=`pwd`
  if [[ ! -z $2 ]]; then
    __LOC=$2
  fi
  purge_adb $__LOC
fi

if [[ -z $1 ]];then
  echo "Usage: $0 ds"
  echo "Usage: $0 ds /tmp/path"
  echo "Usage: $0 adb"
  echo "Usage: $0 adb /tmp/path"
  echo ""
  echo "Executes: find /path -name pattern* -exec rm -rf {} \;"
fi

exit 0