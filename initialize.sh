#!/usr/bin/env bash

LINK_PATH=`pwd`

# Used
function makeLinks {
	BPATH=$1
	SPATH=$2

  if [ -L "$HOME/bin/$BPATH" ];then
		rm $HOME/bin/$BPATH
  fi
	ansi $3 --newline "ln -s $SPATH $HOME/bin/$BPATH"
  ln -s $SPATH $HOME/bin/$BPATH
}

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

# Make sure ~/bin is present
if [ ! -d "$HOME/bin" ];then
	mkdir $HOME/bin
fi

# Utils
for i in $LINK_PATH/utils/*;do
  fname=$(basename $i)
  bname=${fname%.*}
	makeLinks $bname $i "--green"
done

# Docs
for i in $LINKPATH/docs/*;do
  fname=$(basename $i)
  bname=${fname%.*}
  makeLinks $bname $i "--yellow"
done

# Media
for i in $LINKPATH/media/*;do
  fname=$(basename $i)
  bname=${fname%.*}
  makeLinks $bname $i "--blue"
done

# Web
for i in $LINKPATH/web/*;do
  fname=$(basename $i)
  bname=${fname%.*}
  makeLinks $bname $i "--red"
done

# Check if all dependencies are installed
source $LINK_PATH/libs/check_uninstalled.sh
check_uninstalled

echo ""
ansi --green --newline "Install required dependencies to be sure everything runs correctly."
echo ""

exit 0
