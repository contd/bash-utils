#!/usr/bin/env bash

myos=`uname -s`

case "$myos" in
  Darwin)
    DROID_ROOT="$HOME/Library/Android"
    ANDROID_HOME="$DROID_ROOT/sdk"
    NDK_ROOT="/usr/local/Cellar/android-ndk/r10e/"
    ANT_ROOT=""
    COCOS_ROOT="/Applications/Cocos"
    COCOS_CONSOLE_ROOT="$HOME/Library/Cocos/CocosStore"
    ;;
  Linux)
    DROID_ROOT="$HOME/Android"
    ANDROID_HOME="$DROID_ROOT/Sdk"
    NDK_ROOT=""
    ANT_ROOT=""
    COCOS_ROOT=""
    COCOS_CONSOLE_ROOT=""
    ;;
  *) ;;
esac

## Pyenv
if [ -d "$PYENV_ROOT" ];then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

## Go lang
export PATH="$PATH:$GOROOT/bin:$GOPATH/bin"

## Ubuntu make installation of Ubuntu Make binary symlink
export PATH="$HOME/.local/share/umake/bin:$PATH"

## Perlbrew
if [ -f "$PERLBREW_HOME/etc/bashrc" ]; then
  source "$PERLBREW_HOME/etc/bashrc"
  export PATH="$PERLBREW_HOME/perls/current/bin:$PATH"
fi

## LinuxBrew
if [ -d "$LINUX_BREW_HOME" ]; then PATH="$PATH:$LINUX_BREW_HOME/bin"; fi

## NVM for NodeJS
if [ -f "$NVM_DIR/nvm.sh" ]; then source "$NVM_DIR/nvm.sh"; fi

# RVM
if [ "$myos" == "Linux" ]; then
  ## For now only know this works or needed this way for Linux
  if [ -s "$RVM_DIR/scripts/rvm" ];then source "$RVM_DIR/scripts/rvm"; fi
fi

# Android
export ANDROID_HOME
export ANT_ROOT
export PATH="$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$NDK_ROOT:$ANT_ROOT"

# Cocos-2d (OSX Only for now)
if [ -d "/Applications/Cocos" ]; then
  COCOS_CONSOLE_VER="cocos2d-js-v3.6.1"

  export ANT_ROOT="$COCOS_ROOT/tools/ant/bin"
  export COCOS_CONSOLE_ROOT="$COCOS_CONSOLE_ROOT}/$COCOS_CONSOLE_VER/tools/cocos2d-console/bin"

  # Add environment variable COCOS_FRAMEWORKS for cocos2d-x
  export COCOS_FRAMEWORKS="$COCOS_ROOT/frameworks"
  # Finally Add to PATH
  export PATH="$PATH:$COCOS_CONSOLE_ROOT:$COCOS_FRAMEWORKS"
fi

## Electron Debugging
export ELECTRON_ENABLE_LOGGING=true
export ELECTRON_RUN_AS_NODE=true
export ELECTRON_ENABLE_STACK_DUMPING=true

export ELECTRON_DGB="electron --debug=5858 @$"
export ELECTRON_DBG_AUTOSTOP="electron --debug-brk=5858 @$"
export ELECTRON_DBG_OPEN="chrome-cli open http://127.0.0.1:8080/debug?ws=127.0.0.1:8080&port=5858 -n"
export ELECTRON_MAKE_PKG="asar pack @$ $1.asar"

