#!/usr/bin/env bash

while read line;do
  ufw deny from $line
done < lists/topattackers.txt
echo "Finished with topattackers.txt"

while read line;do
  ufw deny from $line
done < lists/afghanistan.txt
echo "Finished with afghanistan.txt"

while read line;do
  ufw deny from $line
done < lists/china.txt
echo "Finished with china.txt"

while read line;do
  ufw deny proto tcp from $line to any port 25
done < lists/spammers_from_emerging.txt
echo "Finished with spammers_from_emerging.txt"

while read line;do
  ufw deny proto tcp from $line to any port 25
done < lists/spammers_found.txt
echo "Finished with spammers_found.txt"

exit 0
