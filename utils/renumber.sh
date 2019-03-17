#!/usr/bin/env bash

for i in *;do
	if [[ -f $i ]];then
		fname=$(basename "$i");
		nname=$(echo $fname | sed 's/^[[:digit:]]_/0&/');
		echo "mv $fname $nname"
		mv "$fname" "$nname"
	fi
done

exit 0
