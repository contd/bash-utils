#!/usr/bin/env bash

#
# check_uninstalled
#
function check_uninstalled
{
    __BINS_TO_CHECK=(awk colordiff convert curl docker ffmpeg gifsicle gpg2 HandBrakeCLI jq nmap openssl pandoc pdftohtml rename rsync unzip wget xsel)
    __NPMS_TO_CHECK=(tidy-markdown thumbsup webshot)
    __PIPS_TO_CHECK=(image-scraper youtube-dl)

    echo "Checking for bins needed..."

    for B in ${__BINS_TO_CHECK[@]};do
        #echo $B
        __BIN_PATH=$(which $B 2>/dev/null)

        if [ "${__BIN_PATH}" == "" ]
        then
            ansi --red "ERROR: $B missing"
            ansi --yellow " - To install, run: sudo apt install $B"
            echo ""
        else
            ansi --green --newline "$B - is installed!"
        fi
    done

    echo ""
    echo "Checking for global npms needed..."

    for N in ${__NPMS_TO_CHECK[@]};do
        #echo $B
        __NPM_PATH=$(which $N 2>/dev/null)

        if [ "${__NPM_PATH}" == "" ]
        then
            ansi --red "ERROR: $N missing"
            ansi --yellow " - To install, run: sudo npm install -g $N"
            echo ""
        else
            ansi --green --newline "npm: $N - is installed!"
        fi
    done
}
