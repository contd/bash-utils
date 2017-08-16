#!/usr/bin/env bash

ROWS=$(tput lines)
COLS=$(tput cols)

while true; do
    # Pick random location
    ROW=$(( $RANDOM % $ROWS ))
    ROW=$(( $ROW + 1 ))
    COL=$(( $RANDOM % $COLS ))
    COL=$(( $COL + 1 ))
    ansi --position=$ROW,$COL --insert-chars
done
