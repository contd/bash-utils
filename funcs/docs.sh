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
