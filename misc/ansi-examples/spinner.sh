#!/usr/bin/env bash

CHARS="\\|/-"

while true; do
    CHAR="${CHARS:0:1}"
    ansi --save-cursor --position=1,1 --faint "$CHAR"
    CHARS="${CHARS:1}$CHAR"
    sleep 1
done
