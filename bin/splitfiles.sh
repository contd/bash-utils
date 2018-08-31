#!/usr/bin/env bash

if [ -z $1 ];then
    echo "Must provide the file you want to split"
    return
fi
awk -v logfile=${1:-"stdin"} '{ print > logfile"-"$1 }' "$1"

: '--- An example to illustrate...
A file "logfile" with keys A, B, C, and containing the lines, e.g.:
        A 489257 8957 38tgzg75ßhg g5hg 5gh27hg 75gh 5hg    0
        C 8 c83h5g 85gh 5hg5hg h 8h8gh t2h gtj2            1
        B 459 wef2 eruhg uiregn euignutibngtnb ioj         2
        B 489257 8957 38tgzg75ßhg g5hg 5gh27hg 75gh 5hg    3
        A 459 wef2 eruhg uiregn euignutibngtnb ioj         4

will be split into three files "logfile-A" (only lines with key A):
        A 489257 8957 38tgzg75ßhg g5hg 5gh27hg 75gh 5hg    0
        A 459 wef2 eruhg uiregn euignutibngtnb ioj         4
"logfile-B" (only lines with key B):
        B 459 wef2 eruhg uiregn euignutibngtnb ioj         2
        B 489257 8957 38tgzg75ßhg g5hg 5gh27hg 75gh 5hg    3
and "logfile-C" (only lines with key C):
        C 8 c83h5g 85gh 5hg5hg h 8h8gh t2h gtj2            1
----'