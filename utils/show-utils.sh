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
    plcolor ${__COLOR} " - $i"
  done
}

#
# Groups: if no arguments then print these to select from
if [ "$#" -le "0" ];then
  plcolor "--blue" "Select from the following groups: "
  for grp in "Local utils: " "Entertainment: " "Development: " "Media: " "Network: " "Utilities: ";do
    plgreen " * $grp"
  done
else
  # Now depending on the arguments, print certain thins (or print everything)

  #
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
  plist "--green" "asciinema pockyt subdownloader youtube-dl ytdl"
  echo ""

  plhead "Development: "
  plist "--red" "aws how2 jq lnav loadtest mycli pgcli"
  echo ""

  plhead "Media: "
  plist "--yellow" "image-scraper imgp pageres svgo"
  echo ""

  plhead "Network: "
  plist "--red" "ifstat iptraf iostat is-up gping"
  echo ""

  plhead "Utilities: "
  plist "--blue" "alder battery-level s speedtest-net moeda wego vtop"
  echo ""

  ansi --blue --newline "--------------------------------------------------------------------"
  plgreen "Get news: (see https://github.com/omgimanerd/getnews.tech)"
  plcolor "--yellow" "  curl getnews.tech/sources"
  echo ""

fi

# All done
exit 0
