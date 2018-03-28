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
if [[ -d "$ANDROID_HOME" ]]; then
	export ANDROID_HOME
	export PATH="$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools"
fi
## AWS
if [[ -f "$HOME/.pyenv/shims/aws_completer" ]]; then
	complete -C "$HOME/.pyenv/shims/aws_completer" aws
fi

## Google Cloud SDK
# The next line updates PATH for the Google Cloud SDK.
if [ -f "/home/jason/google-cloud-sdk/path.bash.inc" ]; then source "/home/jason/google-cloud-sdk/path.bash.inc"; fi
# The next line enables shell command completion for gcloud.
if [ -f "/home/jason/google-cloud-sdk/completion.bash.inc" ]; then source "/home/jason/google-cloud-sdk/completion.bash.inc"; fi

## Calibre Dev
if [[ -d "$HOME/current-projects/calibre" ]]; then
	export CALIBRE_DEVELOP_FROM="$HOME/current-projects/calibre/src"
fi
## ESP8266 Dev
if [[ -d "$HOME/esp-open-sdk" ]]; then
	export PATH="$HOME/esp-open-sdk/xtensa-lx106-elf/bin/:$PATH"
fi
## Minikube & Kubectl
export MINIKUBE_WANTUPDATENOTIFICATION=false
export MINIKUBE_WANTREPORTERRORPROMPT=false
export MINIKUBE_HOME=$HOME
export CHANGE_MINIKUBE_NONE_USER=true
export KUBECONFIG=$HOME/.kube/config

## Electron Debugging
## ONLY TURN THIS ON DURING DEV WORK - DO NOT LEAVE TURNED ON
#export ELECTRON_ENABLE_LOGGING=true
#export ELECTRON_RUN_AS_NODE=true
#export ELECTRON_ENABLE_STACK_DUMPING=true
#export ELECTRON_DGB="electron --debug=5858 @$"
#export ELECTRON_DBG_AUTOSTOP="electron --debug-brk=5858 @$"
#export ELECTRON_DBG_OPEN="chrome-cli open http://127.0.0.1:8080/debug?ws=127.0.0.1:8080&port=5858 -n"
#export ELECTRON_MAKE_PKG="asar pack @$ $1.asar"

