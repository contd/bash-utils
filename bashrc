#!/usr/bin/env bash

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export USE_CCACHE=1
# Set architecture flags
export ARCHFLAGS="-arch x86_64"
# Better .bash_history sizes
HISTSIZE=5000
HISTFILESIZE=20000
shopt -s histappend
export PROMPT_COMMAND='if [ "$(id -u)" -ne 0 ]; then echo "[$(date "+%Y-%m-%d.%H:%M:%S")] $(history 1)  [$(pwd)]" >> ~/.local/logs/bash-history-$(date "+%Y-%m").log; fi'
# First lets findout what os we are on
myos=`uname -s`
# OS Specific vars
case "$myos" in
	Linux)
		export EDITOR="/usr/bin/vim"
		export BASHCOMPL="/etc/bash_completion"
		if [ -f $BASHCOMPL ]; then source $BASHCOMPL; fi
		export PERLBREW_HOME="$HOME/perl5/perlbrew"
		export NVM_DIR="$HOME/.nvm"
		export GOROOT="/usr/local/go"
		export GOPATH="$HOME/go"
		export GOHOME="$GOPATH/src/github.com/contd"
		export RESTIC_REPOSITORY="sftp:jason@lacie:/export/GREENFS/backups"
		;;
	Darwin)
		export EDITOR="/usr/local/bin/vim"
		export MONO_GAC_PREFIX="/usr/local"
		#export BASHCOMPL="/usr/local/etc/bash_completion"
		[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
		export PYENV_ROOT=""
		export PERLBREW_HOME="$HOME/perl5/perlbrew"
		export NVM_DIR="$HOME/.nvm"
		export GOPATH="$HOME/go"
		export GOHOME="$GOPATH/src/github.com/contd"
		source /Users/jason/Library/Preferences/org.dystroy.broot/launcher/bash/br
		;;
  *) ;;
esac
# Reset PATH to clean default
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
## Bash Aliases
if [ -f "$HOME/.bash/aliases/aliases.sh" ]; then source "$HOME/.bash/aliases/aliases.sh"; fi
## Bash Functions
if [ -d "$HOME/.bash/funcs" ]; then
source "$HOME/bash-utils/funcs/dates.sh"
	source "$HOME/bash-utils/funcs/docs.sh"
	source "$HOME/bash-utils/funcs/man.sh"
	source "$HOME/bash-utils/funcs/split-hpath.sh"
fi
## Development Extras
if [ -f "$HOME/.bash/devsetup.sh" ]; then source "$HOME/.bash/devsetup.sh"; fi
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
else
	[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"
	[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"
fi
## Cargo (Rust)
if [ -d $HOME/.cargo ]; then PATH="$HOME/.cargo/bin:$PATH"; fi
## Perl6
if [[ -d $HOME/rakudo ]]; then PATH="$HOME/rakudo/bin:$HOME/rakudo/share/perl6/site/bin:$PATH";fi
## Rbenv
if [[ -d $HOME/.rbenv ]]; then PATH="$HOME/.rbenv/bin:$PATH"; fi
## Composer global tools (etc. laravel, valet, etc)
if [[ -d $HOME/.composer ]]; then PATH="$HOME/.composer/vendor/bin:$PATH"; fi
## Pyenv
if command -v pyenv 1>/dev/null 2>&1; then eval "$(pyenv init -)"; fi
## Terminal Colors
export TERM="xterm-256color"
export CLICOLOR=true
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
export LS_COLORS='di=94:fi=93:ln=32:pi=5:so=1;35;41:bd=1;33;40:cd=1;36;44:or=31:mi=91:ex=31:*.deb=96'
## less colors
export LESSOPEN='|pygmentize -f terminal256 -g -P style=monokai %s'
export LESS='-R'
## Powerline (macOS homebrew)
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
source /Library/Python/3.7/site-packages/powerline/bindings/bash/powerline.sh

## GPG socket bug
GNUPGHOME=~/.gnupg
GPG_TTY=$(tty)
export GPG_TTY
## Home bin
PATH="$HOME/bin:$HOME/.local/bin:$PATH"
export PATH="$PATH"
# kubectl completion
if command -v kubectl 1>/dev/null 2>&1; then source <(kubectl completion bash); fi

## Anything after this was added by something else and should be looked into immediatly!!

