#!/usr/bin/env bash

source $HOME/bash-utils/libs/get_url.sh

if [ -z $1 ];then
	echo "Usage: $0 http://someurl.com"
	exit 1
else
	echo "Savving page to html file..."
	__raw_content=$(geturl $1)
	__html=$(echo $__raw_content | jq -r '.content')

	echo "<!DOCTYPE html><html><head><title>${__title}</title></head><body>"
	echo "${__html}"
	echo "</body></html>"

	exit 0
fi
