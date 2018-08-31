#!/usr/bin/env bash

function showUsage
{
	echo "Usage $0 date2mils 2018-01-28T00:01:00+04:00"
	echo " or "
	echo "Usage: $0 mils2date 1517083260000"
}

#
# date2mils
#
function date2mils
{
	if [ -z "$1" ];then
		showUsage
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
		showUsage
	else
		date -d @`echo "scale=2;${1}/1000" | bc` --utc
	fi
}

if [[ "$1" == "date2mils" ]];then
	date2mils $2
if [[ "$1" == "mils2date" ]];then
	mils2date $2
else
	showUsage
fi