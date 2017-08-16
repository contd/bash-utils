#!/usr/bin/env bash

# don't use pid's they can be doubled in theory
# Under *nix, process IDs are usually allocated on a sequential basis,
# beginning at 0 and rising to a maximum value which varies from system to system.
#  -- see: cat /proc/sys/kernel/pid_max
# Once this limit is reached, allocation restarts at 300 and again increases.
# meanwhile if another proccess taken your stored PID-ID you get a double but
# not the assumed proccess you where looking for!

# use the kernel random generator function instead, the odds of creating
# a few tens of trillions of UUIDs in a year and having one duplicate
uuidkey=$(date +%Y%m%d%H%M%S)

# better use /tmp for lockfiles, gets cleaned after reboot if tmpfs is used...
lockfile=/tmp/${0##*/}.lock

if test -f "$lockfile"
	  then
	    olduuid=`cat $lockfile |awk '{print $2}'`
	    if [ "$olduuid" == "$uuidkey" ]
	      then
		# LoL, this can never be right, one chance in a ...
		echo "This can't be right!, the same UUID's twice"
		echo "new: $uuidkey"
		echo "old: $olduuid"
	      else
		gettimestamp=`cat $lockfile |awk '{print $1}'`
		echo "There is a lockfile, created at: $gettimestamp"
		exit 1
	    fi
	  else
	    echo "`date` $uuidkey" > $lockfile
fi
# got here, put the rest of the script below...
