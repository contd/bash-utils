#!/usr/bin/env bash

if [ "$#" -eq 0 ]; then
    echo "Provide url to mirror!"
    echo "wget -mkEpnp http://www.sitetomirror.org"
else
    WSITE=$1
    wget -mkEpnp $WSITE
fi
