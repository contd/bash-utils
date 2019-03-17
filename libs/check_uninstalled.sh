#!/usr/bin/env bash

#
# check_uninstalled
#
function check_uninstalled() {
	__BINS_TO_CHECK=(awk colordiff convert curl docker ffmpeg gifsicle gpg2 HandBrakeCLI jq nmap openssl pandoc pdftohtml rename rsync unzip wget xsel youtube-dl)
	__NPMS_TO_CHECK=(tidy-markdown thumbsup webshot)

	echo "Checking for bins needed..."

	for B in ${__BINS_TO_CHECK[@]}; do
		#echo $B
		__BIN_PATH=$(which $B 2>/dev/null)

		if [ "${__BIN_PATH}" == "" ]; then
			ansi --red --no-newline "MISSING: "
			ansi --yellow "$B"
			ansi --blue --no-newline " (To install, run: "
			ansi --green --no-newline "sudo apt install $B"
			ansi --blue " )"
		else
			ansi --green --no-newline "$B"
			ansi --blue " - is installed!"
		fi
	done

	echo ""
	echo "Checking for global npms needed..."

	for N in ${__NPMS_TO_CHECK[@]}; do
		#echo $B
		__NPM_PATH=$(which $N 2>/dev/null)

		if [ "${__NPM_PATH}" == "" ]; then
			ansi --red --no-newline "MISSING: "
			ansi --yellow "$N"
			ansi --blue --no-newline " (To install, run: "
			ansi --green --no-newline "sudo npm install -g $N"
			ansi --blue " )"
		else
			ansi --green --no-newline "npm: $N"
			ansi --blue " - is installed!"
		fi
	done
}

if [[ $_ == $0 ]]; then
	check_uninstalled
fi