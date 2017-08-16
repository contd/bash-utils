#!/usr/local/bin/bash

######### Lock checker ###########

myName="`echo $0 | awk '{print $NF}' FS='/'`"

lockDir="/home/kumpfjn/bin/lock/"

lockFile=$lockDir$myName.pid

currentPID=$$

oldPID="`cat $lockFile`"

oldderExist=` kill -0 $oldPID 2&gt;/dev/null ; echo $? `

if [ "$oldderExist" == "0" ]; then 
  echo "An Other Instance Is Running...! PID:$oldPID" ; exit ; 
else 
  echo $currentPID &gt; $lockFile ; 
fi

######### Lock checker ###########

echo "Started!"
