#!/usr/bin/env bash

if [ "$#" -le 0 ];then
  echo "Need to give me a word to lookup."
  exit 1
fi

WORD=$1

URL="https://od-api.oxforddictionaries.com/api/v1/entries/en/${WORD}?source_lang=en&word_id=${WORD}"

curl -X GET \
  "$URL" \
  -H 'Cache-Control: no-cache' \
  -H 'Content: application/json' \
  -H 'app_id: 21a1d5de' \
  -H 'app_key: 3d9aa9465c2d321831dc8f2bf159d5c4'

exit 0
