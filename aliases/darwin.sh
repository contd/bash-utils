#!/usr/bin/env bash

#alias ls="ls --color=auto"
source $HOME/.bash/aliases/common.sh
source $HOME/.bash/aliases/develop.sh

#alias adventure='emacs -batch -l dunnet'
#alias mailsize='du -hs ~/Mail'
alias ttop='top -ocpu -R -F -s 2 -n30'
alias aboutme="archey"
alias supgrade="brew update && brew upgrade && brew cleanup"

# Servers restart
# Old way before: brew service
#alias mongod.start="launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.mongodb.plist"
#alias mongod.start="launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.mongodb.plist"
#alias mongod.start="mongod.stop && mongod.start"
#alias nginx.start='launchctl load ~/Library/LaunchAgents/homebrew.mxcl.nginx.plist'
#alias nginx.stop='launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.nginx.plist'
#alias nginx.restart='nginx.stop && nginx.start'
#alias php-fpm.start="launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.php70.plist"
#alias php-fpm.stop="launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.php70.plist"
#alias php-fpm.restart='php-fpm.stop && php-fpm.start'
#alias mysql.start="launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist"
#alias mysql.stop="launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist"
#alias mysql.restart='mysql.stop && mysql.start'
#alias nginx.logs.error='lnav /usr/local/var/log/nginx/error.log'
#alias nginx.logs.access='lnav /usr/local/var/log/nginx/access.log'
#alias pgdown='pg_ctl -D /usr/local/var/postgres stop -s -m fast'
#alias pgup='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'

