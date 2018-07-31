#!/usr/bin/env bash
#
# svg2jsx.sh
# Copyright (C) 2018 jason <jason@jasonlaptop>
#
# Distributed under terms of the MIT license.
#

for i in *.svg;do 
	fname=$(basename "$i")
	bname=${fname%.*}
	svgr "$i" > $bname.jsx
done

exit 0
