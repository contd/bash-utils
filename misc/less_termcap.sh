#!/usr/bin/env bash

# Get color support for 'less'
export LESS="--RAW-CONTROL-CHARS"

function __less_termcap
{
  #export LESS_TERMCAP_mb=$(tput bold; tput setaf 2) # green
  #export LESS_TERMCAP_md=$(tput bold; tput setaf 6) # cyan
  #export LESS_TERMCAP_me=$(tput sgr0)
  #export LESS_TERMCAP_so=$(tput bold; tput setaf 3; tput setab 4) # yellow on blue
  #export LESS_TERMCAP_se=$(tput rmso; tput sgr0)
  #export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 7) # white
  #export LESS_TERMCAP_ue=$(tput rmul; tput sgr0)
  #export LESS_TERMCAP_mr=$(tput rev)
  #export LESS_TERMCAP_mh=$(tput dim)
  #export LESS_TERMCAP_ZN=$(tput ssubm)
  #export LESS_TERMCAP_ZV=$(tput rsubm)
  #export LESS_TERMCAP_ZO=$(tput ssupm)
  #export LESS_TERMCAP_ZW=$(tput rsupm)
  export LESS_TERMCAP_mb=$(printf '\e[01;31m') # enter blinking mode
  export LESS_TERMCAP_md=$(printf '\e[01;38;5;75m') # enter double-bright mode
  export LESS_TERMCAP_me=$(printf '\e[0m') # turn off all appearance modes (mb, md, so, us)
  export LESS_TERMCAP_se=$(printf '\e[0m') # leave standout mode
  export LESS_TERMCAP_so=$(printf '\e[01;33m') # enter standout mode
  export LESS_TERMCAP_ue=$(printf '\e[0m') # leave underline mode
  export LESS_TERMCAP_us=$(printf '\e[04;38;5;200m') # enter underline mode
}

# Use colors for less, man, etc.
__less_termcap()

exit 0
