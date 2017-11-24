#!/usr/bin/env bash

#
# silk_encr
#
function silk_encr
{
	if [ -z "$1" ];then
		echo "Specify a key name (see gpg --list-keys)"
	fi
	if [ -z "$2" ];then
		echo "Please give the path to the message to encrypt."
	else
		gpg -e -a -r $1 $2
	fi
}
#
# silk_import
#
function silk_import
{
	if [ -z "$1" ];then
		echo "Please give the path to the pgp key file to import."
	else
		gpg --import $1
	fi
}
