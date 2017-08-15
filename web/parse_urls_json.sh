#!/usr/bin/env bash

source $HOME/bash-utils/libs/raw_urlencode.sh
source $HOME/bash-utils/libs/get_url.sh

#----------------------------------------------------------------------------------------------------------
# Begin Main

#to_proc_path=/var/www/html/articles/data
#to_proc_file=proc_urls.txt
to_proc_path=`pwd`
to_proc_file=links_to_read.txt
proc_file=$to_proc_path/$to_proc_file
json_file=$to_proc_path/links_data.json

echo "[{" > "$json_file"

while read p; do
	echo "$p"
	__raw_content=$(geturl $p)
	#echo "${__raw_content},\n" >> "$json_file"
	__title=$(echo $__raw_content | jq -a '.title')
	__filename=$(echo ${__title} | tr -d '[:punct:]' | tr 'A-Z' 'a-z' | sed "s/ /_/g" )
	#__title=$(echo ${__title} | sed 's/"/\\"/g' | sed "s/'/\'/g" | tr -cd [:print:])
	#__title=$(echo ${__title} | recode ascii..html)
	#__excerpt="\"excerpt\": \"$(echo $__raw_content | jq -r '.excerpt' | recode ascii..html)\""
	__enc_title="\"title\": ${__title}"
	__aurl="\"url\": $(echo $__raw_content | jq -a '.url')"
	__excerpt="\"excerpt\": $(echo $__raw_content | jq -a '.excerpt')"
	__html="\"content\": $(echo $__raw_content | jq -a '.content')"
    __date_saved="\"date_saved\": \"$(date)\""
	__html_fn="\"html_file\": \"${__filename}.html\""
	__png_fn="\"png_file\": \"${__filename}.png\""
	__md_fn="\"md_file\": \"${__filename}.md\""

	echo "${__enc_title}," >> "$json_file"
	echo "${__aurl}," >> "$json_file"
	echo "${__excerpt}," >> "$json_file"
	echo "${__date_saved}," >> "$json_file"
	echo "${__html_fn}," >> "$json_file"
	echo "${__png_fn}," >> "$json_file"
	echo "${__md_fn}," >> "$json_file"
	echo "${__html}" >> "$json_file"
	echo "}, {" >> "$json_file"

	sleep 1
done <$proc_file

echo "}]" >> "$json_file"

