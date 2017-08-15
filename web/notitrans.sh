#! /usr/bin/env bash
#
# notitrans.sh
#
# This script uses Google Translate API to translate text from the clipboard and send the results
# as a desktop notification using notify-send from the notify-osd package.
#

__NOTIFY_SEND_PATH="`which notify-send`"
if [ "${__NOTIFY_SEND_PATH}" == "" ]
then
    ansi --red --newline "ERROR: notify-send not installed!!"
    ansi --yellow --newline "To install, run: sudo apt install notify-osd"
    exit 1
fi

__XSEL_PATH="`which xsel`"
if [ "${__XSEL_PATH}" == "" ]
then
    ansi --red --newline "ERROR: xsel not installed!!"
    ansi --yellow --newline "To install, run: sudo apt install xsel"
    exit 1
fi

notify-send --icon=info "$(xsel -o)" "$(wget -U "Mozilla/5.0" -qO - "http://translate.googleapis.com/translate_a/single?client=gtx&sl=auto&tl=en&dt=t&q=$(xsel -o | sed "s/[\"'<>]//g")" | sed "s/,,,0]],,.*//g" | awk -F'"' '{print $2, $6}')"
