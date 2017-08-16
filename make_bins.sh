#!/usr/bin/env bash

for i in $HOME/bin/*;do
  if [ ! -z $i ];then rm $i; fi
done

LINKPATH=`pwd`
ln -s $LINKPATH/utils/ansi.sh $HOME/bin/ansi
# First Check if all dependencies are installed
source $LINKPATH/libs/check_uninstalled.sh
check_uninstalled
ansi --green --newline "Install required dependencies to be sure everything runs correctly."
echo ""

# Functions soured first
for i in $LINKPATH/funcs/*;do
    ansi --yellow --newline "source $i"
    source $i
done
# Utilities next
for i in $LINKPATH/utils/*;do
  if [ ! -d "$i" ];then
    fname=$(basename $i)
    bname=${fname%.*}
    if [ "$bname" != "ansi" ];then
        ansi --green --newline "ln -s $i ~/bin/${bname}"
        ln -s $i ~/bin/$bname
    fi
  fi
done

for i in $LINKPATH/docs/*;do
    fname=$(basename $i)
    bname=${fname%.*}
    ansi --yellow --newline "ln -s $i ~/bin/${bname}"
    ln -s $i ~/bin/$bname
done

for i in $LINKPATH/media/*;do
    fname=$(basename $i)
    bname=${fname%.*}
    ansi --blue --newline "ln -s $i ~/bin/${bname}"
    ln -s $i ~/bin/$bname
done

for i in $LINKPATH/web/*;do
    fname=$(basename $i)
    bname=${fname%.*}
    ansi --yellow --newline "ln -s $i ~/bin/${bname}"
    ln -s $i ~/bin/$bname
done

exit 0
