#!/usr/bin/env bash

function cleanup-docker
{
	# Delete all containers
	echo "Removing all docker containers..."
	docker rm $(docker ps -a -q)
	# Delete all images
	echo "Removing all docker images..."
	docker rmi $(docker images -q)
}
