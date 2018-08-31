#!/usr/bin/env bash

if [ -z "$1" ];then
	echo "Please give the path to the pgp key file to import."
else
	gpg --import $1
fi