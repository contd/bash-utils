#!/usr/bin/env bash

#
# date2mils
#
function date2mils
{
	if [ -z "$1" ];then
		echo "Must provide a date in format: 2018-01-28T00:01:00+04:00"
	else
		date --date="$1" +%s%3N
	fi
}
#
# mils2date
#
function mils2date
{
	if [ -z "$1" ];then
		echo "Please give the path to the pgp key file to import."
	else
		date -d @`echo "scale=2;${1}/1000" | bc` --utc
	fi
}
