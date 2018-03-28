#!/usr/bin/env bash

myos=`uname -s`

case "$myos" in
  Darwin)
    alias adventure='emacs -batch -l dunnet'
    alias mailsize='du -hs ~/Mail'
    alias ttop='top -ocpu -R -F -s 2 -n30'
    ;;
	Linux)
	  colorflag='--color=auto'
    alias ls="command ls ${colorflag}" # ls using colorflag set above
		alias gpg='gpg2'
		alias open="xdg-open"
		alias drive="drive-google"
		alias chrome="google-chrome"
		alias tscreen.off="xinput disable 15" # turns touch screen off (if xid is 15)
		alias tscreen.oon="xinput enable 15"  # run: xinput --list to find xid for touch screen
		alias xgcc="xtensa-lx106-elf-gcc"
		#wkhtmltoimage="export QT_XKB_CONFIG_ROOT=/usr/share/X11/xkb && xvfb-run -a -e /tmp/          wkhtmltoimage-xvfb-run.log wkhtmltoimage"
		;;
  *) ;;
esac
# the essentials
alias vi="vim"
alias dus'=du -sckx * | sort -nr'
alias lo="logout"
# ls command variations
alias lsd='ls -al ${colorflag} | grep \"^d\"'
alias la="ls -al ${colorflag}"
alias l="ls -lh ${colorflag}"
alias ll="ls -alh ${colorflag}"
alias lf="ls -F ${colorflag}"
alias lp="ls -p ${colorflag}"
# grep colors
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
# common cli tweaks
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias rasync='rsync -az --info=progress2'
alias top='htop'
alias wget='wget -c'
alias histg='history | grep'
alias pst='pstree'
alias bc='bc -l'
alias diff='colordiff'
alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T"'
# Stop after sending count ECHO_REQUEST packets #
alias ping='ping -c 5'
# Do not wait interval 1 second, go fast #
alias fastping='ping -c 100 -s.2'
#alias dft='df -Tha --total'
alias df='dfc'
alias tunnel='ssh -f -N tunnel' # See ~/.ssh/config
alias grepc="grep --color=always"
alias today='calendar -A 0 -f /usr/share/calendar/calendar.mark | sort'
# Atom tweaks
#alias atom='tmpin atom'
#alias gda='git diff | tmpin atom'
#
# Senseye dev
#
# runs go test and shows code coverage when complete
alias gocover="go test -coverprofile=coverage.out && go tool cover -html=coverage.out"
# build and run docker-compose
alias figit="docker-compose build && docker-compose up"
# prints out the greatest port number exposed in a docker-compose.yml across all services.
alias last_port="find $SENSEYE_BACKEND -name 'fig.yml' -o -name 'docker-compose.yml' -exec cat {} \; | grep -e '58.*:' | tr -c [[:digit:][:space:]] ' ' | awk '{ print \$1}' | sort -n | tail -1 "
# OS X-friendly version of last_port. Assumes that local port numbers start with 5.
alias last_port="find $SENSEYE_BACKEND -name 'fig.yml' -o -name 'docker-compose.yml' -exec cat {} \; | grep -E '\b5[0-9]+:[0-9]+' | sed -E 's/[^0-9]*([0-9]+):([0-9]+)[^0-9]*/\1/g' | sort -n | tail -1"
# kills all running containers
alias dka='docker kill $(docker ps -q)'
# removes all docker containers
#alias dra='docker rm $(docker ps -a -q)'
# removes all docker images
#alias dri='docker rmi $(docker images -q)'
# removes all docker containers then all docker images
alias cldocker='docker rm $(docker ps -a -q) && docker rmi $(docker images -q)'
# Generates a mock of an interface in package defined in the current working directory
# Usage: makemock <interfaceToMock>
alias makemock='mockgen $(pwd | sed "s:$GOPATH/src/::")'
#
# Common Service shortcuts
#
case "$myos" in
  Darwin)
		# Servers restart
		alias mongod.start="launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.mongodb.plist"
		alias mongod.start="launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.mongodb.plist"
		alias mongod.start="mongod.stop && mongod.start"
		alias nginx.start='launchctl load ~/Library/LaunchAgents/homebrew.mxcl.nginx.plist'
		alias nginx.stop='launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.nginx.plist'
		alias nginx.restart='nginx.stop && nginx.start'
		alias php-fpm.start="launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.php70.plist"
		alias php-fpm.stop="launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.php70.plist"
		alias php-fpm.restart='php-fpm.stop && php-fpm.start'
		alias mysql.start="launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist"
		alias mysql.stop="launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist"
		alias mysql.restart='mysql.stop && mysql.start'
		alias nginx.logs.error='lnav /usr/local/var/log/nginx/error.log'
		alias nginx.logs.access='lnav /usr/local/var/log/nginx/access.log'
		alias pgdown='pg_ctl -D /usr/local/var/postgres stop -s -m fast'
		alias pgup='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
		;;
	Linux)
		# Admin shortcuts
		alias supgrade="sudo apt update && sudo apt upgrade"
		# Services
		alias nginx.start='sudo systemctl start nginx.service'
		alias nginx.stop='sudo systemctl stop nginx.service'
		alias nginx.stat='sudo systemctl status nginx.restart'
		alias nginx.restart='nginx.stop && nginx.start'
    alias nginx.test='sudo nginx -t'
    alias php-fpm.start="sudo systemctl start php7.1-fpm.service"
		alias php-fpm.stop="sudo systemctl stop php7.1-fpm.service"
		alias php-fpm.restart='sudo systemctl restart php7.1-fpm.service'
		;;
	*) ;;
esac
