#!/usr/bin/env bash

myos=`uname -s`

case "$myos" in
  Darwin)
    DROID_ROOT="$HOME/Library/Android"
    ANDROID_HOME="$DROID_ROOT/sdk"
    ;;
  Linux)
    DROID_ROOT="$HOME/Android"
    ANDROID_HOME="$DROID_ROOT/Sdk"
    ;;
  *) ;;
esac

# Android
export ANDROID_HOME
export PATH="$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools"

## AWS
complete -C "$HOME/.pyenv/shims/aws_completer" aws

## Google Cloud SDK
source $HOME/gcloudsdk/completion.bash.inc
source $HOME/gcloudsdk/path.bash.inc

## Calibre Dev
export CALIBRE_DEVELOP_FROM="$HOME/current-projects/calibre/src"

## Electron Debugging
## ONLY TURN THIS ON DURING DEV WORK - DO NOT LEAVE TURNED ON
#export ELECTRON_ENABLE_LOGGING=true
#export ELECTRON_RUN_AS_NODE=true
#export ELECTRON_ENABLE_STACK_DUMPING=true

#export ELECTRON_DGB="electron --debug=5858 @$"
#export ELECTRON_DBG_AUTOSTOP="electron --debug-brk=5858 @$"
#export ELECTRON_DBG_OPEN="chrome-cli open http://127.0.0.1:8080/debug?ws=127.0.0.1:8080&port=5858 -n"
#export ELECTRON_MAKE_PKG="asar pack @$ $1.asar"

