#!/usr/bin/env bash

# Senseye dev
# runs go test and shows code coverage when complete
alias gocover="go test -coverprofile=coverage.out && go tool cover -html=coverage.out"
# build and run docker-compose
alias figit="docker-compose build && docker-compose up"
# prints out the greatest port number exposed in a docker-compose.yml across all services.
alias last_port="find $SENSEYE_BACKEND -name 'fig.yml' -o -name 'docker-compose.yml' -exec cat {} \; | grep -e '58.*:' | tr -c [[:digit:][:space:]] ' ' | awk '{ print \$1}' | sort -n | tail -1 "
# OS X-friendly version of last_port. Assumes that local port numbers start with 5.
alias last_port="find $SENSEYE_BACKEND -name 'fig.yml' -o -name 'docker-compose.yml' -exec cat {} \; | grep -E '\b5[0-9]+:[0-9]+' | sed -E 's/[^0-9]*([0-9]+):([0-9]+)[^0-9]*/\1/g' | sort -n | tail -1"
# kills all running containers
alias dka='docker kill $(docker ps -q)'
# removes all docker containers
#alias dra='docker rm $(docker ps -a -q)'
# removes all docker images
#alias dri='docker rmi $(docker images -q)'
# removes all docker containers then all docker images
alias clear_docker='echo "Removing containers…" && docker rm $(docker ps -a -q) -v -f 2> /dev/null'
alias clean_docker='echo "Removing images…" && docker rmi $(docker images -q) -f 2> /dev/null'
#alias cldocker='docker rm $(docker ps -a -q) && docker rmi $(docker images -q)'
# Generates a mock of an interface in package defined in the current working directory
# Usage: makemock <interfaceToMock>
alias makemock='mockgen $(pwd | sed "s:$GOPATH/src/::")'

