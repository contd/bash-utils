#!/usr/bin/env bash

#
# android_mount
#
function android_mount
{
  hdiutil attach ~/Code/Android/android.dmg.sparseimage -mountpoint /Volumes/android;
}
#
# android_unmount
#
function android_umount
{
  hdiutil detach /Volumes/android;
}
#
# cleardns
#
function cleardns
{
  echo "Flushing DNS by: \`dscacheutil -flushcache && sudo killall -HUP mDNSResponder\`"
  dscacheutil -flushcache && sudo killall -HUP mDNSResponder
}
#
# hidden_hide
#
function hidden_hide
{
    defaults write com.apple.finder AppleShowAllFiles NO;killall Finder /System/Library/CoreServices/Finder.app
}
#
# hidden_show
#
function hidden_show
{
  defaults write com.apple.finder AppleShowAllFiles YES;killall Finder /System/Library/CoreServices/Finder.app
}
#
# isoconvert
#
function isoconvert
{
    if [ "$#" -eq 0 ]; then
        echo "Please specify a file to convert"
    else
        hdiutil convert -format UDRW -o $1.img $1
    fi
}
#
# netinfo
#
function netinfo
{
    echo "########################################"
    echo "  -getinfo \"Ethernet\""
    echo "----------------------------------------"
    networksetup -getinfo "Ethernet"

    echo "########################################"
    echo "  -listlocations "
    echo "----------------------------------------"
    networksetup -listlocations

    echo "########################################"
    echo "  -listBonds "
    echo "----------------------------------------"
    networksetup -listBonds

    echo "########################################"
    echo "  -listallnetworkservices "
    echo "----------------------------------------"
    networksetup  -listallnetworkservices

    #networksetup -listallhardwareports
}
#
# rehashdev
#
function rehashdev
{
	DEVIDX="$HOME/.pow/default/public/index.html"
	echo "<!DOCTYPE html>" > $DEVIDX
	echo "<html>" >> $DEVIDX
	echo "<h1>Dev Projects</h1>" >> $DEVIDX
	echo "<ul>" >> $DEVIDX
  for i in $(ls ~/.pow/); do
    echo "<li><a href=\"http://$i.dev/\" target=\"_blank\">$i.dev</a></li>" >> $DEVIDX
  done
	echo "</ul>" >> $DEVIDX
	echo "</html>" >> $DEVIDX
	chrome-cli open http://default.dev/
}
#
# renfsme
#
function renfsme
{
  if ! [[ -d "/Volumes/BIGNAS" ]]; then
    echo "sudo mkdir /Volumes/BIGNAS"
		echo "sudo chown -R jasonkumpf:staff /Volumes/BIGNAS"
		echo "sudo chmod -R 775 /Volumes/BIGNAS"
    sudo mkdir /Volumes/BIGNAS
		sudo chown -R jasonkumpf:staff /Volumes/BIGNAS
		sudo chmod -R 775 /Volumes/BIGNAS
  fi

	drives=( "Public" "Share" "Backups" "Software" "Library" )

	for i in "${drives[@]}";do
		if ! [[ -d "/Volumes/BIGNAS/$i" ]]; then
			echo "sudo mkdir /Volumes/BIGNAS/$i"
			echo "sudo chown -R jasonkumpf:staff /Volumes/BIGNAS/$i"
			echo "sudo chmod -R 775 /Volumes/BIGNAS/$i"
			sudo mkdir /Volumes/BIGNAS/$i
			sudo chown -R jasonkumpf:staff /Volumes/BIGNAS/$i
			sudo chmod -R 775 /Volumes/BIGNAS/$i
		fi
    echo "mount -t nfs 192.168.200.22:/shares/$i /Volumes/BIGNAS/$i"
    mount -t nfs 192.168.200.22:/shares/$i /Volumes/BIGNAS/$i
  done;
}
#
# umount
#
function umount
{
    if [ "$#" -eq 0 ]; then
        echo "Give disk number (i.e. if /dev/disk3 then pass 3)"
    else
        N=$1
        echo "Unmounting: /dev/disk$N"
        diskutil unmountdisk /dev/disk$N
    fi
}
