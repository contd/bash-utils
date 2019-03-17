#!/usr/bin/env bash

if [ "`ping -c 1 lacie`" ];then
	#rsync -a --delete-before /btrfs/Library/ lacie::library
	#rsync -a --delete-before /btrfs/Media/ lacie::media
	#rsync -a --delete-before /btrfs/Training/ lacie::training
	#rsync -a --delete-before /btrfs/Training_Resources/ lacie::training_resources
	#rsync -a --delete-before /btrfs/vmware/ lacie::vms/VMware/
	rsync -a /btrfs/Library/ lacie::library
	rsync -a /btrfs/Media/ lacie::media
	rsync -a /btrfs/Training/ lacie::training
fi

exit 0
