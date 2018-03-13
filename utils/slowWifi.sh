#!/bin/sh

if [ "$#" -le 0 ];then
  # Should allow to pass net dev
  sudo tc qdisc add dev wlp2s0 handle 1: root htb default 11
  sudo tc class add dev wlp2s0 parent 1: classid 1:1 htb rate 5kbps
  sudo tc class add dev wlp2s0 parent 1:1 classid 1:11 htb rate 5kbps
  echo "Your net device: wlp2s0 is now throttled to 5kbps."
else
  # Clear rules
  sudo tc qdisc del dev wlp2s0 root
  echo "Your net device: wlp2s0 is now unthrottled."
fi

exit 0
