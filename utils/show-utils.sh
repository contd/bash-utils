#/usr/bin/env bash

# Functions
function plhead {
  __TXT=$1
  ansi --green --newline "${__TXT}"
  ansi --green --newline "==================================="
}
function plgreen {
  __TXT=$1
  ansi --green --newline "${__TXT}"
}
function plyell {
  __TXT=$1
  ansi --yellow --newline "${__TXT}"
}
function plcolor {
  __COLOR=$1
  __TXT=$2
  ansi ${__COLOR} --newline "${__TXT}"
}
function plist {
  __COLOR=$1
  __LIST=$2

  for i in ${__LIST};do
    plcolor ${__COLOR} " ✓ $i"
  done
}

#
# Groups: if no arguments then print these to select from
if [ "$1" != "a" ];then
  plcolor "--blue" "Select from the following groups: "
  for grp in "Local utils: " "Entertainment: " "Development: " "Media: " "Network: " "Utilities: ";do
    plgreen " * $grp"
  done
	plcolor "--yellow" "Which group do you want?"
	#read SELGROUP
  #switch $SELGROUP
elif [ "$1" eq "i" ];then
	plhead "Installation for them includes the following: "
	plcolor "--red" "sudo apt install asciinema youtube-dl jq lnav ifstat iftop iptraf nmon speedtest-cli"
  plyell "npm i -g bestet googler movie peerflix pageres-cli svgo iostat is-online-cli is-up-cli gtop battery-level-cli bibtex-search speedtest-net moeda wego vtop how2 loadtest tagui alder"
 plgreen "pip install ddgr awscli image-scraper instagram-scraper mycli pgcli"
 plcolor "--blue" "go get -u github.com/{zquestz/s,otium/ytdl,jingweno/ccat}"
 plcolor "--red" "For these two are unknown: gping progress"
 echo ""
else
  # Now depending on the arguments, print certain thins (or print everything)

  # Local utils in ~/bin/ (linked from bash-utils/utils)
  plhead "Local utils (in ~/bin): "

  for i in $HOME/bash-utils/utils/*.sh;do
    fname=$(basename $i)
    bname=${fname%.*}
  	if [ "$bname" != "show-utils" ];then
      plyell " - $bname"
    fi
  done
  echo ""

  plhead "Entertainment: "
  plist "--green" "asciinema bastet ddgr googler movie peerflix pockyt s youtube-dl ytdl"
  echo ""

  plhead "Development: "
  plist "--red" "aws how2 jq lnav loadtest mycli pgcli tagui"
  echo ""

  plhead "Media: "
  plist "--yellow" "image-scraper imgp instagram-scraper pageres svgo"
  echo ""

  plhead "Network: "
  plist "--red" "ifstat iftop iptraf iostat is-online is-up gping gtop nmon"
  echo ""

  plhead "Utilities: "
  plist "--blue" "alder battery-level bibtex-search ccat progress speedtest-net moeda wego vtop"
  echo ""

  ansi --blue --newline "--------------------------------------------------------------------"
  plgreen "Get news: (see https://github.com/omgimanerd/getnews.tech)"
  plcolor "--yellow" "  curl getnews.tech/sources"
  echo ""

fi

# All done
exit 0
