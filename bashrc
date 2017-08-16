#!/usr/bin/env bash

#ulimit -n 1024
export USE_CCACHE=1
# Set architecture flags
export ARCHFLAGS="-arch x86_64"
# First lets findout what os we are on
myos=`uname -s`
# OS Specific vars
case "$myos" in
  Darwin)
		export EDITOR="/usr/local/bin/vim"
    export MONO_GAC_PREFIX="/usr/local"
		export BASHCOMPL="/usr/local/etc/bash_completion"
    export PYENV_ROOT=""
    export LINUX_BREW_HOME=""
    export PERLBREW_HOME="$HOME/perl5/perlbrew"
    export NVM_DIR="$HOME/.nvm"
    export GOPATH="$HOME/go"
    export GOHOME="$GOPATH/src/github.com/contd"
    ;;
	Linux)
		export EDITOR="/usr/bin/vim"
		export BASHCOMPL="/etc/bash_completion"
    export PERLBREW_HOME="$HOME/perl5/perlbrew"
    export NVM_DIR="$HOME/.nvm"
    export RVM_DIR="$HOME/.rvm"
    export GOROOT="/usr/local/go"
    export GOPATH="$HOME/go"
    export GOHOME="$GOPATH/src/github.com/contd"
		;;
  *) ;;
esac

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"

## Bash Aliases
if [ -f "$HOME/.bash/aliases.sh" ]; then source "$HOME/.bash/aliases.sh"; fi
## Bash Functions
if [ -f "$HOME/.bash/functions.sh" ]; then source "$HOME/.bash/functions.sh"; fi
## Bash Completion
if [ -f "$BASHCOMPL" ]; then source "$BASHCOMPL"; fi

## Perlbrew
PATH="$PERLBREW_HOME/perls/current/bin:$PATH"
if [ -f "$PERLBREW_HOME/etc/bashrc" ]; then
  source "$PERLBREW_HOME/etc/bashrc"
fi
## Go lang
PATH="$PATH:$GOROOT/bin:$GOPATH/bin"

## NVM for NodeJS
export NVM_DIR="$HOME/.nvm"
if [ -f "$NVM_DIR/nvm.sh" ]; then 
	[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
	[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi

# RVM
if [ "$myos" == "Linux" ]; then
  ## For now only know this works or needed this way for Linux
  if [ -s "$RVM_DIR/scripts/rvm" ];then source "$RVM_DIR/scripts/rvm"; fi
fi

## Home bin
PATH="$HOME/bin:$PATH"

export PATH="$PATH"
export TERM="xterm-256color"
export CLICOLOR=true
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

## Powerline
. /usr/lib/python3.6/site-packages/powerline/bindings/bash/powerline.sh 

## Anything after this was added by something else and should be looked into immediatly!!

