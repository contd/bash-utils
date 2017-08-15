#!/usr/bin/env bash

#
# basefilename
#
function basefilename
{
    filepath=$1
    dpath=$(dirname "$filepath")
    fname=$(basename "$filepath")
    exten="${fname##*.}"
    bname="${fname%.*}"

    echo $bname $exten $fname $dpath
}

function bfn_base
{
    retvals=$(basefilename "$1")
    echo $(echo "$retvals" | awk '{print $1}')
}

function bfn_ext
{
    retvals=$(basefilename "$1")
    echo $(echo "$retvals" | awk '{print $2}')
}

function bfn_fname
{
    retvals=$(basefilename "$1")
    echo $(echo "$retvals" | awk '{print $3}')
}

function bfn_dir
{
    retvals=$(basefilename "$1")
    echo $(echo "$retvals" | awk '{print $3}')
}