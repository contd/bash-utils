#!/usr/bin/env bash

if [ -z "$1" ];then
	echo "Specify a key name (see gpg --list-keys)"
fi
if [ -z "$2" ];then
	echo "Please give the path to the message to encrypt."
else
	gpg -e -a -r $1 $2
fi
