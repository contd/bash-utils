#!/usr/bin/env bash

#
# prog_tar
#
function progress_tar 
{
  if [ "$#" -eq 0 ]; then
    echo "You need to give the path you want to make the tar.bz2 from!"
  else
	  TPATH=$1
	  SIZE=`du -sk $1 | cut -f 1`
	  tar cf - ${TPATH} | pv -p -s ${SIZE}k | bzip2 -c > ${TPATH}.tar.bz2
  fi
}
