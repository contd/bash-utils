#!/usr/bin/env bash

# the essentials
alias vi="vim"
alias df="dfc"
alias top="htop"
alias diff="colordiff"
# ls command variations
alias ll="ls -alh"
alias l="ls -lh"
alias la="ls -al"
alias lsd="ls -al | grep \"^d\""
alias lf="ls -F"
alias lp="ls -p"
# common cli tweaks
alias bc="bc -l"
alias grep="grep --color=always"
alias egrep="egrep"
alias fgrep="fgrep"
# handy additions
alias histg="history | grep"
alias pst="pstree"
alias path="echo -e ${PATH//:/\\n}"
alias today="calendar -A 0 -f /usr/share/calendar/calendar.mark | sort"
alias top10="du -a ./* | sort -n -r | head -n 10"
# network tools
alias rasync="rsync -az --info=progress2"
alias wget="wget -c"
alias ping="ping -c 5" # Stop after sending count ECHO_REQUEST packets #
alias fastping="ping -c 100 -s.2" # Do not wait interval 1 second, go fast #
#alias digip="dig +short myip.opendns.com @resolver1.opendns.com"
alias myip="curl ipinfo.io"
alias ip="curl -4 http://icanhazip.com"
alias ip6="curl -6 http://icanhazip.com"
alias scannet="sudo nmap -sP 192.168.200.1/24"
alias tunnel="ssh -f -N tunnel" # See ~/.ssh/config
alias nets="lsof -Pni4 | grep LISTEN | grep"
alias speedtest="wget -O /dev/null http://speedtest.wdc01.softlayer.com/downloads/test10.zip"
# Misc
alias address="echo 13021 Old Stagecoach Rd. Apt. 2511 Laurel, MD 20708"
