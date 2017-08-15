#!/usr/bin/env bash

echo "Please enter the wireless interface you wish to use"
read -e wifiinterface
echo "Please enter the routers ip address(or any system you wish to ping)"
read -e pingaddress

count=0
echo "Interface: $wifiinterface    Ping Address: $pingaddress" >> ~/wifianalyse.log
echo "        Time           Count                    Output                              Ping"
echo "        Time           Count                    Output                              Ping" >> ~/wifianalyse.log
while [ 1 -eq 1 ]
do
	sleep 1
	count=$((count + 1))
	countf=$(printf "%05s" $count)
	wifioutput=$(iwconfig $wifiinterface | grep -i --color quality)
	pingoutput=$(ping -c 1 $pingaddress | grep -E -o -m 1 'time.{0,10}' & )
	curtime=$(date +%d/%m/%y\ %H:%M:%S)
	echo [$curtime] "| " "$countf""  |  " $wifioutput " |   " $pingoutput
	echo [$curtime] "| " "$countf""  |  " $wifioutput " |   " $pingoutput >> ~/wifianalyse.log
done
