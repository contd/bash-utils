#!/usr/bin/env bash

myos=`uname -s`

case "$myos" in
  Darwin)
    DROID_ROOT=~/Library/Android
    ANDROID_HOME=$DROID_ROOT/sdk
		ANDROID_SDK_ROOT=$ANDROID_HOME
    ;;
  Linux)
		ANDROID_HOME="$HOME/Android/Sdk"
    ;;
  *) ;;
esac
#
## Android
if [[ -d $ANDROID_HOME ]]; then
  export ANDROID_HOME
  export ANDROID_SDK_ROOT
  export PATH=${PATH}:${ANDROID_HOME}/emulator:${ANDROID_HOME}/tools:${ANDROID_HOME}/tools/bin:${ANDROID_HOME}/platform-tools
fi
#
## AWS
#export AWS_PROFILE="default"  # aws default profile
#export ECS_PROFILE="default"  # ecs default profile
#
## Google Cloud SDK
if [[ -d ~/google-cloud-sdk ]];then
	# The next line updates PATH for the Google Cloud SDK.
	source ~/google-cloud-sdk/path.bash.inc
	source ~/google-cloud-sdk/completion.bash.inc
fi

#
## Qt (linux and macOS)
#if [[ -d $HOME/Qt ]];then
#	export QT_DIR=$HOME/Qt
#	export QT_VERSION=5.13.0
#	export QT_API=5.13.0
#	export CGO_CFLAGS_ALLOW=".*"
#	export CGO_CXXFLAGS_ALLOW=".*"
#	export CGO_LDFLAGS_ALLOW=".*"
#fi

## Calibre Dev
#if [[ ! -z "~/current-projects/calibre" ]]; then
#	export CALIBRE_DEVELOP_FROM="~/current-projects/calibre/src"
#fi
## ESP8266 Dev
#if [[ ! -z "~/esp-open-sdk" ]]; then
#	export PATH="~/esp-open-sdk/xtensa-lx106-elf/bin/:$PATH"
#fi

## Electron Debugging
## ONLY TURN THIS ON DURING DEV WORK - DO NOT LEAVE TURNED ON
#export ELECTRON_ENABLE_LOGGING=true
#export ELECTRON_RUN_AS_NODE=true
#export ELECTRON_ENABLE_STACK_DUMPING=true
#export ELECTRON_DGB="electron --debug=5858 @$"
#export ELECTRON_DBG_AUTOSTOP="electron --debug-brk=5858 @$"
#export ELECTRON_DBG_OPEN="chrome-cli open http://127.0.0.1:8080/debug?ws=127.0.0.1:8080&port=5858 -n"
#export ELECTRON_MAKE_PKG="asar pack @$ $1.asar"

#export QT_DIR=~/Qt
#export QT_VERSION=5.11.1
