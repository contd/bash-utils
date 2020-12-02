#!/usr/bin/env bash
#
# glyphs.sh
# Copyright (C) 2020 jason <jason@Jasons-MacBook-Air.local>
#
# Distributed under terms of the MIT license.
#

perl -CS -e 'for($i=160;$i<10000;$i++){print chr $i, $i%30?" ":"\n"}'
echo

