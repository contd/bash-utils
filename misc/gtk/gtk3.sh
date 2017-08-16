#!/usr/bin/env bash

export ARCHFLAGS="-arch x86_64"
export PREFIX=$HOME/Glade/build
export PATH=$HOME/Glade/build/bin:$HOME/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin
export PYTHONPATH=$HOME/gtk/inst/lib/python2.7/site-packages

CPPFLAGS="-I/usr/local/opt/gettext/include -I$PREFIX/include"
LDFLAGS="-L/usr/local/opt/gettext/lib -L/usr/local/opt/libffi/lib -L$PREFIX/lib"
#CPPFLAGS=-I$PREFIX/include
#LDFLAGS=-L$PREFIX/lib
PKG_CONFIG_PATH=$PREFIX/lib/pkgconfig:/usr/local/lib/pkgconfig
LD_LIBRARY_PATH=$PREFIX/lib:/usr/local/lib
PATH="$PREFIX/bin:$PATH"

export CPPFLAGS LDFLAGS PKG_CONFIG_PATH
export LD_LIBRARY_PATH PATH

#export PATH=$HOME/.local/bin:$PATH
#export PKG_CONFIG_PATH=$PREFIX/lib/pkgconfig
#export GSETTINGS_SCHEMA_DIR=$PREFIX/share/glib-2.0/schemas

#export GTK_MAC_CFLAGS=$PREFIX/include
#export GTK_MAC_LIBS=$PREFIX/lib

#export CPPFLAGS=-I$PREFIX/include
#export LDFLAGS=-L$PREFIX/lib
#export LD_LIBRARY_PATH=$PREFIX/lib

