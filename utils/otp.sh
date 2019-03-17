#!/usr/bin/env bash

if [ -z $1 ]; then
  echo
  echo "Usage:"
  echo "   otp google"
  echo
  echo "Configuration: $HOME/.otpkeys"
  echo "Format: name=key"
  exit
fi

OTPKEY="$(sed -n "s/${1}=//p" $HOME/.otpkeys)"

if [ -z "$OTPKEY" ]; then
  echo "$(basename $0): Bad Service Name '$1'"
  $0
  exit
fi

oathtool --totp -b "$OTPKEY"
