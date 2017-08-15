#!/usr/bin/env bash

function set-prompt
{
  Last_Command=$? # Must come first!
  Blue='\[\e[01;34m\]'
  White='\[\e[01;37m\]'
  Red='\[\e[01;31m\]'
  Green='\[\e[01;32m\]'
  Reset='\[\e[00m\]'
  FancyX='\342\234\227'
  Checkmark='\342\234\223'

  # Add a bright white exit status for the last command
  PS1="$White\$? "
  # If it was successful, print a green check mark. Otherwise, print
  # a red X.
  if [[ $Last_Command == 0 ]]; then
    PS1+="$Green$Checkmark "
  else
    PS1+="$Red$FancyX "
  fi
  # If root, just print the host in red. Otherwise, print the current user
  # and host in green.
  if [[ $EUID == 0 ]]; then
    PS1+="$Red\\h "
  else
    PS1+="$Green\\u@\\h "
  fi
  # Print the working directory and prompt marker in blue, and reset
  # the text color to the default.
  PS1+="$Blue\\w \\\$$Reset "
}

function colors
{
	# Colors: Print colors
  echo -e "\033[0mCOLOR_NC (No color)"
  echo -e "\033[1;37mCOLOR_WHITE\t\033[0;30mCOLOR_BLACK"
  echo -e "\033[0;34mCOLOR_BLUE\t\033[1;34mCOLOR_LIGHT_BLUE"
  echo -e "\033[0;32mCOLOR_GREEN\t\033[1;32mCOLOR_LIGHT_GREEN"
  echo -e "\033[0;36mCOLOR_CYAN\t\033[1;36mCOLOR_LIGHT_CYAN"
  echo -e "\033[0;31mCOLOR_RED\t\033[1;31mCOLOR_LIGHT_RED"
  echo -e "\033[0;35mCOLOR_PURPLE\t\033[1;35mCOLOR_LIGHT_PURPLE"
  echo -e "\033[0;33mCOLOR_YELLOW\t\033[1;33mCOLOR_LIGHT_YELLOW"
  echo -e "\033[1;30mCOLOR_GRAY\t\033[0;37mCOLOR_LIGHT_GRAY"
}

# Colors Ref
function colorsref
{
  local fgc bgc vals seq0

  printf "Color escapes are %s\n" '\e[${value};...;${value}m'
  printf "Values 30..37 are \e[33mforeground colors\e[m\n"
  printf "Values 40..47 are \e[43mbackground colors\e[m\n"
  printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"

  # foreground colors
  for fgc in {30..37}; do
    # background colors
    for bgc in {40..47}; do
      fgc=${fgc#37} # white
      bgc=${bgc#40} # black

      vals="${fgc:+$fgc;}${bgc}"
      vals=${vals%%;}

      seq0="${vals:+\e[${vals}m}"
      printf "  %-9s" "${seq0:-(default)}"
      printf " ${seq0}TEXT\e[m"
      printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
    done
    echo; echo
  done
}

