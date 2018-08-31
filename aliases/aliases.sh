#!/usr/bin/env bash

myos=`uname -s`

case "$myos" in
  Darwin)
	  source $HOME/.bash/aliases/darwin.sh
    ;;
	Linux)
	  source $HOME/.bash/aliases/linux.sh
		;;
  *) ;;
esac
