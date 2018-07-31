#!/usr/bin/env bash

function cheat
{
  if [[ "$#" -eq 0 ]]; then
    echo "Usage: $0 tar"
    echo "Usage: $0 rsync"
  elif [[ "$#" -eq 1 ]]; then
    curl "https://cheat.sh/${1}"
  fi
}

