#!/usr/bin/env bash

#
# convpdf2html
#
function convpdf2html
{
    if [ "$#" -eq 0 ]; then
        echo "Please provide the pdf file path you want to convert to html"
    else
        bname=$(bfn_base "$1")
        exten=$(bfn_ext "$1")

        if ! [[ -d "$bname" ]] ; then
            echo "mkdir \"$bname\""
            mkdir $bname
        fi
        echo "pdftohtml -noframes -q -p -c \"$bname.$exten\" \"$bname/index.html\""
        pdftohtml -noframes -q -p -c "$bname.$exten" "$bname/index.html"
    fi
}
#
# docx2md
#
function docx2md
{
    if [ "$#" -lt 2 ]; then
        echo "Must provide the .docx file and the name of the markdown file (i.e. file.md)"
    elif [ "$#" -eq 1 ]; then
        pandoc -o "$1.docx" --extract-media images "$1.md" --no-wrap --normalize --smart
    else
        pandoc -o "$1.docx" --extract-media images "$2.md" --no-wrap --normalize --smart
    fi
}
#
# man
#
# Replaces man command with color profiles set then runs man command.
#
function man
{
	env LESS_TERMCAP_md=$'\e[1;36m' \
		LESS_TERMCAP_me=$'\e[0m' \
		LESS_TERMCAP_se=$'\e[0m' \
		LESS_TERMCAP_so=$'\e[1;40;92m' \
		LESS_TERMCAP_ue=$'\e[0m' \
		LESS_TERMCAP_us=$'\e[1;32m' man "$@"
}
#
# md_go_lang
#
function md_go_lang
{
	if [ "$#" -le "0" ];then
		echo "Need to pass the file to change."
	else
		FPATH=$1
		CF='```'
		CLANG=$2
		CREPL=$CF$CLANG
		awk -F '```' '{for (i=1; i<NF; i++) {OFS=c%2?FS:"```go"; printf "%s%s", $i, OFS; c++} print $NF}' $FPATH
	fi
}
#
# md_js_lang
#
function md_js_lang
{
	if [ "$#" -le "0" ];then
		echo "Need to pass the file to change."
	else
		FPATH=$1
		CF='```'
		CLANG=$2
		CREPL=$CF$CLANG
		awk -F '```' '{for (i=1; i<NF; i++) {OFS=c%2?FS:"```js"; printf "%s%s", $i, OFS; c++} print $NF}' $FPATH
	fi
}
#
# pandown
#
function pandown
{
	if [ "$#" -le "0" ];then
		echo "You need to give the file or url to convert to markdown and epub."
	else
		URL=$1
		fname=$(basename $1)
		bname=${fname%.*}

		STD_FMT="--wrap=none --ascii --smart "
		MD_FMT="${STD_FMT} --atx-headers "

		if [ "$#" -ge "2" ] && [ "$2" = "epub" ];then
			pandoc -f html $1 -t epub3 $STD_FMT -o $bname.epub
		else
			pandoc -f html $1 -t markdown_strict $MD_FMT -o $bname.md
		fi
	fi
}
#
# recur_pandown
#
function recur_pandown
{
	if "$#" -le "0" ];then
		__BASE_DIR=`pwd`/
	else
		__BASE_DIR=$1
	fi
	echo "Running pandown on all epub files in: ${__BASE_DIR}"
	for i in ${__BASE_DIR}/*.epub;do
		pandown "$i"
	done
}
#
# multi_pandown
#
function multi_pandown
{
	if [ "$#" -le "0" ];then
		echo "Need to speficy a file of urls to process."
		return 1
	else
		FILENAME=`pwd`/$1
		while IFS= read -r line
		do
			pandown "$line"
		done < $FILENAME

		return 0
	fi
  return 0
}
#
# remove_head
#
function remove_head
{
 	if [ -z $1 ];then
		echo "Usage: $0 2,3 ext"
		return
	elif [ -z $2 ];then
		echo "Usage: $0 2,5 md"
		return
	else
		echo "Removing lines: $1 from files: *.$2"
		echo "Using: sed -i\".bak\" \"${1}d\" *.$2"
		#echo "This is used to remove lines n to m from files"
		for i in *.$2; do
		    #sed -i".bak" '2d' $i
				echo "Fixing: $i"
		    sed -i".bak" "${1}d" $i
		done
	fi
}
#
# splitfiles
#
function splitfiles
{
    if [ -z $1 ];then
        echo "Must provide the file you want to split"
        return
    fi
    awk -v logfile=${1:-"stdin"} '{ print > logfile"-"$1 }' "$1"

    : '--- An example to illustrate...
    A file "logfile" with keys A, B, C, and containing the lines, e.g.:
            A 489257 8957 38tgzg75ßhg g5hg 5gh27hg 75gh 5hg    0
            C 8 c83h5g 85gh 5hg5hg h 8h8gh t2h gtj2            1
            B 459 wef2 eruhg uiregn euignutibngtnb ioj         2
            B 489257 8957 38tgzg75ßhg g5hg 5gh27hg 75gh 5hg    3
            A 459 wef2 eruhg uiregn euignutibngtnb ioj         4

    will be split into three files "logfile-A" (only lines with key A):
            A 489257 8957 38tgzg75ßhg g5hg 5gh27hg 75gh 5hg    0
            A 459 wef2 eruhg uiregn euignutibngtnb ioj         4
    "logfile-B" (only lines with key B):
            B 459 wef2 eruhg uiregn euignutibngtnb ioj         2
            B 489257 8957 38tgzg75ßhg g5hg 5gh27hg 75gh 5hg    3
    and "logfile-C" (only lines with key C):
            C 8 c83h5g 85gh 5hg5hg h 8h8gh t2h gtj2            1
    ----'
}