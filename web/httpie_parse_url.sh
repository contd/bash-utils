#!/usr/bin/env bash

source $HOME/bash-utils/libs/raw_urlencode.sh
source $HOME/bash-utils/libs/get_url.sh
source $HOME/bash-utils/libs/cleanup.sh
source $HOME/bash-utils/libs/check_dirs_out.sh

#--------------------------------------------------------------------------------------------------
# Global settings

__MODE=single
__date_saved=$(date +"%H-%M-%S_%m_%d_%Y")
__filepath=`pwd`
__data_json="${__filepath}/data.json"
__url_fn_list="${__filepath}/url_to_filename.csv"

to_proc_path=/var/www/html/pub
to_proc_file=urls_to_read.txt
fin_filename="${date_saved}_${to_proc_file}"

#--------------------------------------------------------------------------------------------------

function proc_url
{
	__raw_content=$(geturl $1)

	__title=$(echo $__raw_content | jq -r '.title')
	__aurl=$(echo $__raw_content | jq -r '.url')
	__excerpt=$(echo $__raw_content | jq -r '.excerpt')
	__html=$(echo $__raw_content | jq -r '.content')
	__img_url=$(echo $__raw_content | jq -r '.lead_image_url')

	__filename=$(echo $__title | tr -d '[:punct:]' | tr 'A-Z' 'a-z' | sed "s/ /_/g" )
	__html_fn="${__filepath}/${__filename}.html"
	__txt_fn="${__filepath}/${__filename}.txt"
	__md_fn="${__filepath}/${__filename}.md"
	__tidy_md_fn="${__filepath}/_${__filename}.md"

	# Save urls to filename to file for shots MODE
	if [ $__MODE = "batch" ];then
		echo "${1} ${__filename}" >> $__url_fn_list
	fi
	# Use lead_image_url to get a thumbnail from source then resize to 100x100px
	__png_fn="${__filepath}/png/${__filename}.png"
	wget --quiet "${__img_url}" -O "${__png_fn}"
	convert $__png_fn -resize x100 $__png_fn
	# Save raw json output to file
	echo ${__raw_content} | jq -M . > "${__filepath}/${__filename}.json"

	echo "<!DOCTYPE html><html><head><title>${__title}</title></head><body>" > "$__html_fn"
	#echo "<h1>${__title}</h1><p><a href=\"${__aurl}\" target=\"_new\">Original URL</a></p>" >> "$__html_fn"
	#echo "<p><blockquote>${__excerpt}</blockquote></p>" >> "$__html_fn"
	echo "${__html}" >> "$__html_fn"
	echo "</body></html>" >> "$__html_fn"

	#pandoc --ascii --smart --atx-headers -f html "$__html_fn" -t markdown_strict -o "$__md_fn"
	pandoc --wrap=none --ascii --smart --atx-headers -f html "$__html_fn" -t markdown_github -o "$__md_fn"
	pandoc --wrap=none --ascii --smart -f html "$__html_fn" -t plain -o "$__txt_fn"

	if [ tidy-markdown < "$__md_fn" > "$__tidy_md_fn" ];then
	  tidy-markdown < "$__md_fn" > "$__tidy_md_fn"
	  mv "$__tidy_md_fn" "$__md_fn"
	  mv "$__md_fn" "$__tidy_md_fn"
	  cat $__tidy_md_fn >> $__md_fn
	fi

	__esc_excerpt=$(echo $__excerpt | sed 's/"/\"/g')
}

function take_pictures
{
	__aurl=$1
	__filename=$2 #(echo $__title | tr -d '[:punct:]' | tr 'A-Z' 'a-z' | sed "s/ /_/g" )
	__title=$(echo $__filename | sed "s/_/ /g")

	__png_fn="${__filepath}/png/${__filename}.png"
	__full_png="${__filepath}/png/${__filename}_full.png"

	webshot --quality 100 "${__aurl}" "${__full_png}";
	cp "${__full_png}" "${__png_fn}"
	convert $__png_fn -resize x100 $__png_fn
}

#--------------------------------------------------------------------------------------------------
# Begin main

# Decide which mode to run
case "$1" in
  batch)
    # Batch mode from a list of urls in a file
    __MODE=batch
    echo "Saving to: $__filepath"
    proc_file=$to_proc_path/$to_proc_file
    #echo "URL FileName" > $__url_fn_list
    check_dirs_out

    while read p; do
      echo "$p"
      proc_url $p
      sleep 2
    done <$proc_file

    cleanup
    ;;
  shots)
    __MODE=shots
    proc_file=`pwd`/$2

    while read p; do
      echo $p
      take_pictures $p
    done <$proc_file
    ;;
  single)
    __MODE=single
    echo "Saving to: $__filepath"
    check_dirs_out
    proc_url $2
    cleanup
    ;;
  *)
    echo "Usage: $0 batch"
    echo "Usage: $0 shots url_to_filename.csv"
    echo "Usage: $0 single http://someurl.com"
esac

#--------------------------------------------------------------------------------------------------
exit 0
