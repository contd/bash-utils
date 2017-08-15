#!/usr/bin/env bash

if [ "$#" -le "0" ];then
	echo "Usage: ./cert.sh [gen|proc]"
	exit 1
fi

if [ "$1" != "proc" ];then
	if [ "$1" != "gen" ];then
		echo "Need to give the cname (fqn of zip file)"
		echo "  Example: ./cert.sh proc kumpf.me gris"
		echo "Need to give the root domain and the sub domain for cert"
		echo "  Example: ./cert.sh gen kumpf.me code"
		exit 1
	fi
fi

if [ "$1" = "proc" ];then
	domain=$1
	cname="${2}.${domain}"

	unzip "${cname}.zip"
	unzip OtherServer.zip
	mkdir zip
	mv *.zip zip/
	mv root.crt 1_* zip/
	mv "2_${cname}.crt" "${cname}.crt"
	cat "${cname}.crt" "${cname}.key" > "${cname}.pem"
	cp "${cname}.crt" "${cname}.key" "${cname}.pem" "/etc/ssl/${domain}/"
fi

if [ "$1" = "gen" ];then
	domain_root=$1
	sub=$2

	sub_ou=$(echo $sub  | sed -e 's/.*/\L&/' -e 's/[a-z]*/\u&/g')
	cname="${sub}.${domain_root}"

	openssl req -newkey rsa:2048 -keyout ${cname}.key -out ${cname}.csr -subj "/C=US/ST=Ohio/L=Cincinnati/O=Global Security/OU=${sub_ou} Department/CN=${cname}"

	mv "${cname}.key" "${cname}.key_locked"
	openssl rsa -in "${cname}.key_locked" -out "${cname}.key"
fi
