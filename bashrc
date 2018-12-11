#!/usr/bin/env bash

#ulimit -n 1024
export USE_CCACHE=1
# Set architecture flags
export ARCHFLAGS="-arch x86_64"
# Better .bash_history sizes
HISTSIZE=5000
HISTFILESIZE=20000
shopt -s histappend
export PROMPT_COMMAND='if [ "$(id -u)" -ne 0 ]; then echo "[$(date "+%Y-%m-%d.%H:%M:%S")] $(history 1)  [$(pwd)]" >> ~/.local/logs/bash-history-$(date "+%Y-%m").log; fi'
#export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
# First lets findout what os we are on
myos=`uname -s`
# OS Specific vars
case "$myos" in
	Linux)
		export EDITOR="/usr/bin/vim"
		export BASHCOMPL="/etc/bash_completion"
    export PERLBREW_HOME="$HOME/perl5/perlbrew"
    export NVM_DIR="$HOME/.nvm"
    export RVM_DIR="$HOME/.rvm"
    export GOROOT="/usr/local/go"
    export GOPATH="$HOME/go"
    export GOHOME="$GOPATH/src/github.com/contd"
		export RESTIC_PASSWORD=$(cat ~/.config/restic/restic_password)
		export RESTIC_REPOSITORY="sftp:jason@lacie:/export/GREENFS/backups"
		;;
  Darwin)
		export EDITOR="/usr/local/bin/vim"
    export MONO_GAC_PREFIX="/usr/local"
		export BASHCOMPL="/usr/local/etc/bash_completion"
    export PYENV_ROOT=""
    export PERLBREW_HOME="$HOME/perl5/perlbrew"
    export NVM_DIR="$HOME/.nvm"
    export GOPATH="$HOME/go"
    export GOHOME="$GOPATH/src/github.com/contd"
    ;;
  *) ;;
esac

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"

## Bash Aliases
if [ -f "$HOME/.bash/aliases/aliases.sh" ]; then source "$HOME/.bash/aliases/aliases.sh"; fi
## Bash Functions
if [ -d "$HOME/.bash/funcs" ]; then 
	source "$HOME/bash-utils/funcs/docker.sh"
	source "$HOME/bash-utils/funcs/docs.sh"
	source "$HOME/bash-utils/funcs/man.sh"
fi
## Development Extras
if [ -f "$HOME/.bash/devsetup.sh" ]; then source "$HOME/.bash/devsetup.sh"; fi
## Bash Completion
if [ -f "$BASHCOMPL" ]; then source "$BASHCOMPL"; fi

## Perlbrew
if [ -f "$PERLBREW_HOME/etc/bashrc" ]; then
	PATH="$PERLBREW_HOME/perls/current/bin:$PATH"
  source "$PERLBREW_HOME/etc/bashrc"
fi
## Go lang
if [ -d "$GOROOT" ]; then PATH="$PATH:$GOROOT/bin"; fi
if [ -d "$GOPATH" ]; then PATH="$PATH:$GOPATH/bin"; fi

## NVM for NodeJS
export NVM_DIR="$HOME/.nvm"
if [ -f "$NVM_DIR/nvm.sh" ]; then 
	[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
	[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi

## RVM
if [[ -d "$HOME/.rvm" ]]; then PATH="$PATH:$HOME/.rvm/bin"; fi

## Pyenv
if [ -d "$HOME/.pyenv" ];then
	PATH="$HOME/.pyenv/bin:$PATH"
	eval "$(pyenv init -)"
	eval "$(pyenv virtualenv-init -)"
fi

## Cargo (Rust)
if [ -d "$HOME/.cargo" ]; then PATH="$HOME/.cargo/bin:$PATH"; fi

## Perl6
if [[ -d $HOME/rakudo ]]; then PATH=$HOME/rakudo/bin:$HOME/rakudo/share/perl6/site/bin:$PATH;fi

export TERM="xterm-256color"
export CLICOLOR=true
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
export LS_COLORS='di=94:fi=93:ln=32:pi=5:so=1;35;41:bd=1;33;40:cd=1;36;44:or=31:mi=91:ex=31:*.deb=96'

## Powerline
PWRLINE="/usr/share/powerline/bindings/bash/powerline.sh"
if [ -f "$PWRLINE" ]; then . $PWRLINE; fi 

## GPG socket bug
GNUPGHOME=~/.gnupg
GPG_TTY=$(tty)
export GPG_TTY

## Home bin
PATH="$HOME/bin:$HOME/.local/bin:$PATH"
export PATH="$PATH"

## Anything after this was added by something else and should be looked into immediatly!!
