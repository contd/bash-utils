#!/usr/bin/env bash

if [ -z $1 ]; then
  echo
  ansi --green "Usage:"
  ansi --cyan  "  otp google"
  ansi --cyan  "  otp github"
  echo
  ansi --blue  "Configuration: $HOME/.otpkeys"
  ansi --green "Format: name=key"
  exit
fi

OTPKEY="$(sed -n "s/${1}=//p" $HOME/.otpkeys)"

if [ -z "$OTPKEY" ]; then
  ansi --red "$(basename $0): Bad Service Name '$1'"
  $0
  exit 1
fi

oathtool --totp -b "$OTPKEY"
