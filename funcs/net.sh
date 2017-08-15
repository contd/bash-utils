#!/usr/bin/env bash

#
# mirror_site
#
function mirror_site
{
    if [ "$#" -eq 0 ]; then
        echo "Provide url to mirror!"
        echo "wget -mkEpnp http://www.sitetomirror.org"
    else
        WSITE=$1
        wget -mkEpnp $WSITE
    fi
}
#
# myip
#
function myip
{
    curl ipinfo.io
}
#
# nets
#
function nets
{
    if [ "$#" -eq 0 ]; then
      echo "lsof -Pni4 | grep LISTEN | grep <process>"
    else
      lsof -Pni4 | grep LISTEN | grep $1
    fi
}
#
# scanet
#
function scanet
{
    sudo nmap -sP 192.168.200.1/24
}
#
# speedtest
#
function speedtest
{
  wget -O /dev/null http://speedtest.wdc01.softlayer.com/downloads/test10.zip
}
#
# tunnel_crashplan
#
function tunnel_crashplan
{
  ssh -f -L 4200:localhost:4243 root@crashplan -N
}
