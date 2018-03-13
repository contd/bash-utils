#!/usr/bin/env bash

#
# check_dirs_out
#
function check_dirs_out
{
  if [ ! -d "${__filepath}/tidy" ];then mkdir "${__filepath}/tidy"; fi
  if [ ! -d "${__filepath}/png" ];then mkdir -p $__filepath/png; fi
  if [ ! -d "${__filepath}/html" ];then mkdir "${__filepath}/html"; fi
  if [ ! -d "${__filepath}/json" ];then mkdir "${__filepath}/json"; fi
  if [ ! -d "${__filepath}/txt" ];then mkdir "${__filepath}/txt"; fi
}
