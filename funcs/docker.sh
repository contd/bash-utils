#!/usr/bin/env bash

#
# finds the IP address of a container.  A bit fragile, but it works for me so far...
function ipof {
  if [[ $# < 1 ]];then
    echo "Usage: ipof <container>"
    return
  fi
  docker inspect "$1" | grep -m 1 \"IPAddress\" | cut -d":" -sf 2 | sed 's/[^0-9.]//g'
}
#
# Opens an interactive bash shell in the specified container
function dbash {
  if [[ $# < 1 ]];then
    echo "Usage: dbash <container> [bash arguments]"
    return
  fi
  container=$1
  shift
  docker exec -it "$container" bash $@
}
#
# Attempts to connect to a mongo database within the specified container using the specified client
function xmgo {
  if [[ $# < 2 ]];then
    echo "Usage: xmgo client <container>[/database] [mongo arguments]"
    return
  fi
  client=$1
  shift
  hostanddb=$1
  shift
  host=${hostanddb%/*}
  db=${hostanddb##*/}

  if [[ "$host" == "$db" ]];then
    db=""
  else
    db="/$db"
  fi
  $client "`ipof $host`$db" $@
}
#
# Attempts to connect to the mongo database on the specified container using the mongo cli.
# Usage is cmgo <containerName>[/databaseName]
function cmgo {
  xmgo "mongo" $@
}
#
# Opens an interactive bash shell in the specified container
function dbash {
  if [[ $# < 1 ]];then
    echo "Usage: dbash <container> [bash arguments]"
    return
  fi
  container=$1
  shift
  docker exec -it "$container" bash $@
}
#
# resolveResults is designed to be used internally by other functions, not directly by the user.
# It takes an array of options, and asks the user to choose one.  The value of the chosen option is
# placed into $REPLY
function resolveResults {
  results=("$@")
  if [ ${#results[@]} -eq 0 ];then
    echo "No results found"
    REPLY=""
    return
  fi

  if [ ${#results[@]} -gt 1 ];then
    echo "Multiple results found:"
    PS3="Choose one: "
    select f in $(basename -a ${results[@]});do
      if [ "$f" != "" ];then
        REPLY="${results[$REPLY-1]}"
        break
      fi
    done
  else
    REPLY=$results
  fi
}
#
# findServiceByAcronym will return the path of a service with the specified acronym.  It requires
# $SENSEYE_BACKEND, $SENSEYE_ANALYTICS, and $SENSEYE_EXTERNAL to be set to the path of the backend, analytics and external
# repositories respectively.
#
# Makes use of resolveResults
function findServiceByAcronym {
  search=".*/"
  for char in $(echo $1 | grep -o .);do
    search="$search$char[^-/]*-"
  done
  search="${search::-1}$"
  results=($(find "$SENSEYE_BACKEND" "$SENSEYE_ANALYTICS" "$SENSEYE_EXTERNAL" -maxdepth 2 -type d -regextype posix-extended -regex $search))
  resolveResults "${results[@]}"
}
#
# Changes directory to a service given by the specified acronym.  Provides a select list if the acronym is ambiguous.
# Usage cda <acronym>
# Example: cda ads
# 	The example will CD into the anomaly detection service.
#
# Makes use of findServiceByAcronym. See that function's documentation for requirements.
function cda {
  findServiceByAcronym $1
  if [ "$REPLY" != "" ];then
    cd $REPLY
  fi
}
#
# srepo opens a given service's code in bitbucket on the commit which your local git repository believes to be the head of origin/master.
# This makes use of findServiceByAcronym.
srepo() {
  if [[ $# < 1 ]];then
    echo "Usage: srepo <service acronym>"
    return
  fi
  findServiceByAcronym $1

  if [[ $REPLY != "" ]];then
    cd $REPLY
    REPO_PATH=$(git remote -v | tail -1 | awk '{print $2}')

    if [[ $REPO_PATH != "https://bitbucket.org/"* ]];then
      echo "Origin, '$REPO_PATH', is not an https bitbucket URL."
      return
    fi
    COMMIT_HASH=$(git rev-parse origin/develop)
    REPO_OFFSET=$(git rev-parse --show-prefix)
    xdg-open "$REPO_PATH/src/$COMMIT_HASH/$REPO_OFFSET"
    cd -
  fi
}
#
# Finds a README.md file for one of our top-level services.
# Note that this will not work for test-tools or data-ingestion/* services.
# Usage: readme <service_name>
# service-name may be the beginning of the service name (e.g. event, for the event-storage service)
#
# Makes use of findServiceByAcronym
function readme {
  if [[ $# < 1 ]];then
    echo "Usage: readme <servicename>"
    return
  fi

  if [ -z ${MD_VIEWER+1} ];then
    echo 'MD_VIEWER environment variable must be set to your preferred markdown viewer.'
    return
  fi

  if [ -z ${SENSEYE_BACKEND+1} ];then
    echo "SENSEYE_BACKEND environment variable must be set.  It should not contain a trailing /.";
    return
  fi

  if [ -z ${SENSEYE_ANALYTICS+1} ];then
    echo "SENSEYE_ANALYTICS environment variable must be set.  It should not contain a trailing /.";
    return
  fi

  if [ -z ${SENSEYE_EXTERNAL+1} ];then
    echo "SENSEYE_EXTERNAL environment variable must be set.  It should not contain a trailing /.";
    return
  fi

  findServiceByAcronym $1

  if [ "$REPLY" != "" ];then
    $MD_VIEWER "$REPLY/README.md"
  fi
}
