#!/usr/bin/env bash

export PREFIX=$HOME/gtk/inst

export PYTHONPATH=$PREFIX/lib/python2.7/site-packages
export PATH=$HOME/.local/bin:$PATH
export PKG_CONFIG_PATH=$PREFIX/lib/pkgconfig
export GSETTINGS_SCHEMA_DIR=$PREFIX/share/glib-2.0/schemas

export GTK_MAC_CFLAGS=$PREFIX/include
export GTK_MAC_LIBS=$PREFIX/lib

export CPPFLAGS=-I$PREFIX/include
export LDFLAGS=-L$PREFIX/lib
export LD_LIBRARY_PATH=$PREFIX/lib


