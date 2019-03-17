#!/usr/bin/env bash

source $HOME/bash-utils/funcs/docs.sh

if [ "$#" -eq "1" ];then
	cd $1/
	for i in *.html;do
		pandoc -f html "$i" -t markdown_strict --smart --ascii --atx-headers --wrap=none -o "$i.md"
	done
	rename 's/\.html\.md/\.md/' *.md
	mv *.md ../
	cd ../
fi

for i in *.md;do
	mv "$i" "_$i"
	tidy-markdown < "_$i" > "$i"
done

for i in *.md;do
	md_cf_lang "$i" go > "$i.x" && mv "$i.x" "$i"
done

fcnt=0

if [ ! -z "cover.jpg" ];then
	echo "Have a cover!"
	((fcnt++))
fi
if [ ! -z "README.md" ];then
	echo "Have a README.md!"
	((fcnt++))
fi
if [ ! -z "SUMMARY.md" ];then
	echo "Have a SUMMARY.md!"
	((fcnt++))
fi

echo $fcnt

if [ "$fcnt" -eq "3" ];then
	echo "Have 3 count!"
	echo " "
	echo "Adding a git repo to we are ready for GitBook"
	git init && git add . && git commit -m "Initial commit"
fi

exit 0
