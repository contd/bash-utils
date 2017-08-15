#!/usr/bin/env bash

#
# geturl
#
function geturl
{
    source $HOME/bash-utils/libs/token.sh
    __url_in=$1
    __url_pre='https://mercury.postlight.com/parser?url='
    __url_comb="${__url_pre}${__url_in}"
    __token="${__MERCURY_TOKEN}"
    __results=$(curl -s -X GET -H "Cache-Control: no-cache" -H "x-api-key: ${__token}" "${__url_comb}")
    echo $__results
}
