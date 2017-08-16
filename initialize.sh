#!/usr/bin/env bash

ln -s $HOME/bash-utils $HOME/.bash

for _HFILE in bashrc bash_profile bash_logout;do
	if [ -f $HOME/.$_HFILE ];then
		mv $HOME/.$_HFILE $HOME/.$_HFILE.bak
		ln -s $HOME/bash-utils/$_HFILE $HOME/.$_HFILE
	fi
done

if [ ! -d "$HOME/bin" ];then
	mkdir $HOME/bin
else
	for i in $HOME/bin/*;do
		if [ ! -z $i ];then rm $i; fi
	done
fi

# Need ansi setup right away for color terminal
ln -s $HOME/bash-utils/utils/ansi.sh $HOME/bin/ansi
# First Check if all dependencies are installed
source $HOME/bash-utils/libs/check_uninstalled.sh
check_uninstalled
echo ""
ansi --green --newline "Install required dependencies to be sure everything runs correctly."
echo ""

exit 0
