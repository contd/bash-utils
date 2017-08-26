#!/usr/bin/env bash

source $HOME/bash-utils/libs/get_url.sh

if [ -z $1 ];then
	echo "Usage: $0 http://someurl.com"
	exit 1
else
	#echo "Savving page to html file..."
	__filepath=`pwd`
	__raw_content=$(geturl $1)

	__title=$(echo $__raw_content | jq -r '.title')
	__aurl=$(echo $__raw_content | jq -r '.url')
	__excerpt=$(echo $__raw_content | jq -r '.excerpt')
	__html=$(echo $__raw_content | jq -r '.content')
	__img_url=$(echo $__raw_content | jq -r '.lead_image_url')

	__filename=$(echo $__title | tr -d '[:punct:]' | tr 'A-Z' 'a-z' | sed "s/ /_/g" )
	__html_fn="${__filepath}/${__filename}.html"

	echo "<!DOCTYPE html><html><head><title>${__title}</title>" > ${__html_fn}
	echo "<!-- ===========================================================================" >> ${__html_fn}
	echo "  Title: ${__title} " >> ${__html_fn}
	echo "  Url: ${__aurl} " >> ${__html_fn}
	echo "  Excerpt: ${__excerpt} " >> ${__html_fn}
	echo "  ImgUrl: ${__img_url} " >> ${__html_fn}
	echo "=============================================================================-->" >> ${__html_fn}
	echo "</head><body>${__html}" >> ${__html_fn}
	echo "</body></html>" >> ${__html_fn}

	exit 0
fi
