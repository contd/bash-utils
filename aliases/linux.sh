#!/usr/bin/env bash

# the essentials
source $HOME/.bash/aliases/common.sh

alias dus'=du -sckx * | sort -nr'
alias lo="logout"
#alias gpg='gpg2 --batch --no-tty'

# Laptop/Desktop specific
alias open="xdg-open"
alias drive="drive-google"
alias chrome="google-chrome"
alias tpad.off="xinput disable 15" # turns touch screen off (if xid is 15)
alias tpad.on="xinput enable 15"  # run: xinput --list to find xid for touch screen
alias tscreen.off="xinput disable 14" # turns touch screen off (if xid is 15)
alias tscreen.on="xinput enable 14"  # run: xinput --list to find xid for touch screen
#wkhtmltoimage="export QT_XKB_CONFIG_ROOT=/usr/share/X11/xkb && xvfb-run -a -e /tmp/wkhtmltoimage-xvfb-run.log wkhtmltoimage"

alias flush-dns="sudo systemctl restart systemd-resolved.service && sudo systemd-resolve --statistics"
#alias flush-dns="sudo systemd-resolve --flush-caches"

source $HOME/.bash/aliases/develop.sh
source $HOME/.bash/aliases/senseye.sh
source $HOME/.bash/aliases/services.sh

