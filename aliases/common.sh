#!/usr/bin/env bash

# the essentials
alias vi="vim"
alias df="dfc"
alias top="htop"
alias diff="colordiff"
# ls command variations
colorflag="--color=auto"
alias ls="command ls ${colorflag}" # ls using colorflag set above
alias ll="ls -alh ${colorflag}"
alias l="ls -lh ${colorflag}"
alias la="ls -al ${colorflag}"
alias lsd="ls -al ${colorflag} | grep \"^d\""
alias lf="ls -F ${colorflag}"
alias lp="ls -p ${colorflag}"
# common cli tweaks
alias bc="bc -l"
alias grepc="grep --color=always"
alias egrep="egrep ${colorflag}"
alias fgrep="fgrep ${colorflag}"
# handy additions
alias histg="history | grep"
alias pst="pstree"
alias path="echo -e ${PATH//:/\\n}"
alias now='date +"%T"'
alias today="calendar -A 0 -f /usr/share/calendar/calendar.mark | sort"
alias top10="du -a ./* | sort -n -r | head -n 10"
# network tools
alias rasync="rsync -az --info=progress2"
alias wget="wget -c"
alias ping="ping -c 5" # Stop after sending count ECHO_REQUEST packets #
alias fastping="ping -c 100 -s.2" # Do not wait interval 1 second, go fast #
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias myip="curl ipinfo.io"
alias scannet="sudo nmap -sP 192.168.200.1/24"
alias tunnel="ssh -f -N tunnel" # See ~/.ssh/config
alias nets="lsof -Pni4 | grep LISTEN | grep"
alias speedtest="wget -O /dev/null http://speedtest.wdc01.softlayer.com/downloads/test10.zip"

