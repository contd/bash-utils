#! /usr/bin/env bash

#
# atom-flight-manual-build.sh
#

read -p "Which step to run: [1,2,3,4]" __STEP

if [ "$__STEP" = "" ];then
	echo "No step picked."
	exit 1
else
	if [ "$__STEP" = "1" ];then
		while read url; do
			bname=$(basename $url)
			ansi --green $url; ansi --yellow --newline " - $bname"
			pandoc -f html "${url}" --smart --ascii --wrap=none -t epub -o "${bname}.epub"
			sleep 1
		done <urls.txt
	elif [ "$__STEP" = "3" ];then
		if [ ! -d "zip" ];then mkdir zip; fi
		if [ ! -d "images" ];then mkdir images; fi
		cnt=1
		for i in *;do
			if [ -d "$i" ];then
				(( cnt++ ))
        bname=$i
				fname="$i.epub"
				mv "$bname/${bname}.zip" $fname
				if [ -d "$bname/media" ];then
					mv $bname/media/* images/
					rename "s/file/0${cnt}_file/" images/*
        fi
			fi
		done
	elif [ "$__STEP" = "4" ];then
		image-scraper $url
	else
		for i in *.epub;do
			fname=$(basename $i)
			bname=${fname%.*}
			if [ "$__STEP" = "2" ];then
				mkdir $bname
				mv ${fname} "$bname/${bname}.zip"
				cd $bname/
				unzip "${bname}.zip"
				cp ch001.xhtml "../${bname}.xhtml"
				cd ../
			fi
		done
  fi
fi

exit 0

#http://flight-manual.atom.io/getting-started/sections/why-atom
#http://flight-manual.atom.io/getting-started/sections/installing-atom
#http://flight-manual.atom.io/getting-started/sections/atom-basics

#http://flight-manual.atom.io/using-atom/sections/atom-packages
#http://flight-manual.atom.io/using-atom/sections/moving-in-atom
#http://flight-manual.atom.io/using-atom/sections/atom-selections
#http://flight-manual.atom.io/using-atom/sections/editing-and-deleting-text
#http://flight-manual.atom.io/using-atom/sections/find-and-replace
#http://flight-manual.atom.io/using-atom/sections/snippets
#http://flight-manual.atom.io/using-atom/sections/autocomplete
#http://flight-manual.atom.io/using-atom/sections/folding
#http://flight-manual.atom.io/using-atom/sections/panes
#http://flight-manual.atom.io/using-atom/sections/pending-pane-items
#http://flight-manual.atom.io/using-atom/sections/grammar
#http://flight-manual.atom.io/using-atom/sections/version-control-in-atom
#http://flight-manual.atom.io/using-atom/sections/writing-in-atom
#http://flight-manual.atom.io/using-atom/sections/basic-customization

#http://flight-manual.atom.io/hacking-atom/sections/tools-of-the-trade
#http://flight-manual.atom.io/hacking-atom/sections/the-init-file
#http://flight-manual.atom.io/hacking-atom/sections/package-word-count
#http://flight-manual.atom.io/hacking-atom/sections/package-modifying-text
#http://flight-manual.atom.io/hacking-atom/sections/creating-a-theme
#http://flight-manual.atom.io/hacking-atom/sections/iconography
#http://flight-manual.atom.io/hacking-atom/sections/debugging
#http://flight-manual.atom.io/hacking-atom/sections/writing-specs
#http://flight-manual.atom.io/hacking-atom/sections/cross-platform-compatibility
#http://flight-manual.atom.io/hacking-atom/sections/converting-from-textmate

#http://flight-manual.atom.io/behind-atom/sections/configuration-api
#http://flight-manual.atom.io/behind-atom/sections/keymaps-in-depth
#http://flight-manual.atom.io/behind-atom/sections/scoped-settings-scopes-and-scope-descriptors
#http://flight-manual.atom.io/behind-atom/sections/serialization-in-atom
#http://flight-manual.atom.io/behind-atom/sections/developing-node-modules
#http://flight-manual.atom.io/behind-atom/sections/interacting-with-other-packages-via-services
#http://flight-manual.atom.io/behind-atom/sections/maintaining-your-packages
