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
    #alias ls="ls --color=auto"
    # ls using colorflag set above
    alias ls="command ls ${colorflag}"
		alias gpg='gpg2'
		alias open="xdg-open"
		alias drive="drive-google"
		alias chrome="google-chrome"
		#alias wkhtmltoimage="export QT_XKB_CONFIG_ROOT=/usr/share/X11/xkb && xvfb-run -a -e /tmp/wkhtmltoimage-xvfb-run.log wkhtmltoimage"
		;;
  *) ;;
esac

alias vi="vim"
alias dus'=du -sckx * | sort -nr'
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias lo="logout"
# See ~/.ssh/config
alias tunnel='ssh -f -N tunnel'

# common cli tweaks
alias grepc="grep --color=always"
alias today='calendar -A 0 -f /usr/share/calendar/calendar.mark | sort'
# ls command variations
alias lsd='ls -al ${colorflag} | grep \"^d\"'
alias la="ls -al ${colorflag}"
alias l="ls -lh ${colorflag}"
alias ll="ls -alh ${colorflag}"
alias lf="ls -F ${colorflag}"
alias lp="ls -p ${colorflag}"
#alias lh='ls -a | egrep "^\."'
alias top='htop'
alias wget='wget -c'
alias histg='history | grep'
alias pst='pstree'
#alias dft='df -Tha --total'
alias df='dfc'
#alias dun='ncdu'
#alias clust1='csshX cluster1'
#alias clust2='csshX cluster2'
alias rasync='rsync -az --info=progress2'
#alias atom='tmpin atom'
alias gda='git diff | tmpin atom'

# Senseye dev
alias figit="docker-compose build && docker-compose up"
alias dka='docker kill $(docker ps -q)'

case "$myos" in
  Darwin)
		# Servers restart
		alias mongod.start="launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.mongodb.plist"
		alias mongod.start="launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.mongodb.plist"
		alias mongod.start="mongod.stop && mongod.start"

		#alias couchres='/usr/bin/sudo launchctl stop homebrew.mxcl.couchdb'
		#alias couchstr='/usr/bin/sudo launchctl load -w /Library/LaunchDaemons/homebrew.mxcl.couchdb.plist'
		#alias couchstp='/usr/bin/sudo launchctl unload /Library/LaunchDaemons/homebrew.mxcl.couchdb.plist'

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
		#alias nginx.logs.default.access='tail -250f /usr/local/var/log/nginx/default.access.log'
		#alias nginx.logs.default-ssl.access='tail -250f /usr/local/var/log/nginx/default-ssl.access.log'
		#alias nginx.logs.error='tail -250f /usr/local/etc/nginx/logs/error.log'
		#alias nginx.logs.access='tail -250f /usr/local/etc/nginx/logs/access.log'
		#alias nginx.logs.default.access='tail -250f /usr/local/etc/nginx/logs/default.access.log'
		#alias nginx.logs.default-ssl.access='tail -250f /usr/local/etc/nginx/logs/default-ssl.access.log'

		alias pgdown='pg_ctl -D /usr/local/var/postgres stop -s -m fast'
		alias pgup='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
		;;
	Linux)
		# Services
		alias nginx.start='sudo systemctl start nginx.service'
		alias nginx.stop='sudo systemctl stop nginx.service'
		alias nginx.stat='sudo systemctl status nginx.restart'
		alias nginx.restart='nginx.stop && nginx.start'
		;;
	*) ;;
esac
