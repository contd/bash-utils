#!/usr/bin/env bash
#
# write2sd.sh
# Copyright (C) 2018 jason <jason@jasonlaptop>
#
# Distributed under terms of the MIT license.
#

if [[ -z $1 ]]; then
	/bin/lsblk
	echo ""
fi

if [[ -z "$2" ]]; then
	echo "Usage ./write2sd.sh image-file.img sdX"
	exit 1
fi

IMG_FILE=$1
DEST=$2

sudo dd bs=4M if=$IMG_FILE of=/dev/$DEST status=progress conv=fsync

exit 0
