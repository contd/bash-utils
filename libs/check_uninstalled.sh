#!/usr/bin/env bash

#
# check_uninstalled
#
function check_uninstalled
{
    __BINS_TO_CHECK=(awk colordiff convert curl docker ffmpeg gifsicle gpg2 HandBrakeCLI jq nmap openssl pandoc pdftohtml rename rsync unzip wget xsel youtube-dl)
    __NPMS_TO_CHECK=(tidy-markdown thumbsup webshot)
		# To check if need: pip install ImageScraper
    __PIPS_TO_CHECK=(image-scraper)

    echo "Checking for bins needed..."

    for B in ${__BINS_TO_CHECK[@]};do
        #echo $B
        __BIN_PATH=$(which $B 2>/dev/null)

        if [ "${__BIN_PATH}" == "" ]
        then
            ansi --red "MISSING: "; ansi --yellow "$B"
						ansi --blue " (To install, run: "; ansi --green "sudo apt install $B"; ansi --blue " )"
						echo ""
        else
            ansi --green "$B"; ansi --blue " - is installed!"
						echo ""
        fi
    done

    echo ""
    echo "Checking for global npms needed..."

    for N in ${__NPMS_TO_CHECK[@]};do
        #echo $B
        __NPM_PATH=$(which $N 2>/dev/null)

        if [ "${__NPM_PATH}" == "" ]
        then
            ansi --red "MISSING: "; ansi --yellow "$N"
						ansi --blue " (To install, run: "; ansi --green "sudo npm install -g $N"; ansi --blue " )"
						echo ""
        else
            ansi --green "npm: $N"; ansi --blue " - is installed!"
						echo ""
        fi
    done
}
