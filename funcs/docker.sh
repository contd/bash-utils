#!/usr/bin/env bash

#
# finds the IP address of a container.  A bit fragile, but it works for me so far...
#
function ipof {
  if [[ $# < 1 ]]
  then
    echo "Usage: ipof <container>"
    return
  fi
 
  docker inspect "$1" | grep -m 1 \"IPAddress\" | cut -d":" -sf 2 | sed 's/[^0-9.]//g'
}
#
# Opens an interactive bash shell in the specified container
#
function dbash {
  if [[ $# < 1 ]]
  then
    echo "Usage: dbash <container> [bash arguments]"
    return
  fi 
 
  container=$1
  shift
 
  docker exec -it "$container" bash $@
}
#
# cldocker
#
function cldocker
{
	# Delete all containers
	echo "Removing all docker containers..."
	docker rm $(docker ps -a -q)
	# Delete all images
	echo "Removing all docker images..."
	docker rmi $(docker images -q)
}
