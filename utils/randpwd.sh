#!/usr/bin/env bash

#
# randpwd.sh
# Copyright (C) 2018 jason <jason@jasonlaptop>
#
# Distributed under terms of the MIT license.
#

if [ "$#" -le "0" ];then
	ansi --red --newline "Usage: $0 10"
	exit 1
fi

__PWDLEN=$1

# 10 Methods given a length

# Method 1
date +%s | sha256sum | base64 | head -c $__PWDLEN ; echo
# Method 2
< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c${1:-32};echo;
# Method 3
openssl rand -base64 $__PWDLEN
# Method 4
tr -cd '[:alnum:]' < /dev/urandom | fold -w30 | head -n1
# Method 5
# Method 6
# Method 7
# Method 8
# Method 9
# Method 10
