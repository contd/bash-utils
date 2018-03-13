#!/usr/bin/env bash

LINK_PATH=`pwd`

# Make sure .bash is present
if [ ! -L "$HOME/.bash" ];then
	ln -s $HOME/bash-utils $HOME/.bash
fi

# Make sure std bash files are present
for _HFILE in bashrc bash_profile bash_logout;do
	if [ ! -L "$HOME/.$_HFILE" ];then
		if [ -f $HOME/.$_HFILE ];then
			mv $HOME/.$_HFILE $HOME/.$_HFILE.bak
			ln -s $HOME/bash-utils/$_HFILE $HOME/.$_HFILE
		fi
	fi
done

# Setup links to ~/bin/
. ./make_links.sh

# Check if all dependencies are installed
source $LINK_PATH/libs/check_uninstalled.sh
check_uninstalled

echo ""
ansi --green --newline "Install required dependencies to be sure everything runs correctly."
echo ""

exit 0
