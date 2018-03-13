#!/usr/bin/env bash


if [ "$#" -lt 3 ]; then
  ansi --yellow --newline "Usage: `basename $0` /path/to/pics base-name mp4"
  ansi --yellow --newline "Usage: `basename $0` . base-name jpg"
  exit 1
fi

PICSPATH=$1
BASENAME=$2
EXTEN=$3
cnt=0

for i in $PICSPATH/*.$EXTEN; do
  fname=$(basename "$i")
  bname=${fname%.*}
	(( cnt++ ))
	PNUM=$(printf "%03d" $cnt)
	mv "$i" "${PICSPATH}/${BASENAME}-${PNUM}.$EXTEN"
done

exit 0
