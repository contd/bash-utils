#!/usr/bin/env bash

LINK_PATH=`pwd`

# For below
function makeLinks {
	BPATH=$1
	SPATH=$2

  if [ -L "$HOME/bin/$BPATH" ];then
		rm $HOME/bin/$BPATH
  fi
	ansi $3 --newline "ln -s $SPATH $HOME/bin/$BPATH"
  ln -s $SPATH $HOME/bin/$BPATH
}

# Make sure ~/bin is present
if [ ! -d "$HOME/bin" ];then
	mkdir $HOME/bin
fi

# Utils
for i in $LINK_PATH/utils/*;do
  fname=$(basename $i)
  bname=${fname%.*}
	if [ $bname != "ansi" ];then
		makeLinks $bname $i "--green"
	fi
done

# Docs
for i in $LINK_PATH/docs/*;do
  fname=$(basename $i)
  bname=${fname%.*}
  makeLinks $bname $i "--yellow"
done

# Media
for i in $LINK_PATH/media/*;do
  fname=$(basename $i)
  bname=${fname%.*}
  makeLinks $bname $i "--blue"
done

# Web
for i in $LINK_PATH/web/*;do
  fname=$(basename $i)
  bname=${fname%.*}
  makeLinks $bname $i "--red"
done
