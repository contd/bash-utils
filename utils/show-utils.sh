#/usr/bin/env bash

# LISTS of commands by their GROUP (add new ones here)
ENTERTAIN=(asciinema bastet ddgr googler movie peerflix pockyt s youtube-dl ytdl)
DEVELOP=(aws how2 jq lnav loadtest mycli pgcli tagui)
MEDIA=(image-scraper imgp instagram-scraper pageres svgo lepto)
NETWORK=(ifstat iftop iptraf iostat is-online is-up gping gtop nmon)
UTILITIES=(alder battery-level bibtex-search ccat progress speedtest-net moeda wego vtop)

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

  for i in ${__LIST[@]};do
    plcolor ${__COLOR} " ✓ $i"
  done
}

#
# Groups: if no arguments then print these to select from
if [[ $1 == "" ]];then
  plcolor "--blue" "Select from the following groups: "
  for grp in "Local utils: " "Entertainment: " "Development: " "Media: " "Network: " "Utilities: ";do
    plgreen " * $grp"
  done
	ansi "--yellow" "Options: "
  plcolor "--green" "`basename $0` [a|s|i]"
elif [[ $1 == "s" ]]; then
  plhead "Entertainment: "
  for i in ${ENTERTAIN[@]};do
    which $i
  done
  echo ""

  plhead "Development: "
  for i in ${DEVELOP[@]};do
    which $i
  done
  echo ""

  plhead "Development: "
  for i in ${DEVELOP[@]};do
    which $i
  done
  echo ""

  plhead "Media: "
  for i in ${MEDIA[@]};do
    which $i
  done
  echo ""

  plhead "Network: "
  for i in ${NETWORK[@]};do
    which $i
  done
  echo ""

  plhead "Utilities: "
  for i in ${UTILITIES[@]};do
    which $i
  done
  echo ""

elif [[ $1 == "i" ]];then
	plhead "Installation for them includes the following: "
	plcolor "--red" "Install: sudo apt install <app>"
  plcolor "--red" "  Apps: asciinema youtube-dl jq lnav ifstat iftop iptraf nmon speedtest-cli"
  plcolor "--yellow" "Install: npm i -g <app>"
  plcolor "--yellow" "  Apps: bestet googler movie peerflix pageres-cli svgo iostat is-online-cli "
  plcolor "--yellow" "        is-up-cli gtop battery-level-cli bibtex-search speedtest-net moeda wego"
  plcolor "--yellow" "        vtop how2 loadtest tagui alder lepto-cli"
  plcolor "--green" "Install: pip install <apps>"
  plcolor "--green" "  Apps: ddgr awscli image-scraper instagram-scraper mycli pgcli"
  plcolor "--blue" "Install: go get -u github.com/path/app"
  plcolor "--blue" "  Path/Apps: zquestz/s, otium/ytdl, jingweno/ccat"
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
  for i in ${ENTERTAIN[@]};do
    plcolor "--green" " ✓ $i"
  done
  echo ""

  plhead "Development: "
  for i in ${DEVELOP[@]};do
    plcolor "--red" " ✓ $i"
  done
  echo ""

  plhead "Media: "
  for i in ${MEDIA[@]};do
    plcolor "--yellow" " ✓ $i"
  done
  echo ""

  plhead "Network: "
  for i in ${NETWORK[@]};do
    plcolor "--red" " ✓ $i"
  done
  echo ""

  plhead "Utilities: "
  for i in ${UTILITIES[@]};do
    plcolor "--blue" " ✓ $i"
  done
  echo ""

  ansi --blue --newline "--------------------------------------------------------------------"
  plgreen "Get news: (see https://github.com/omgimanerd/getnews.tech)"
  plcolor "--yellow" "  curl getnews.tech/sources"
  echo ""

fi

# All done
exit 0
