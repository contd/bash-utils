#! /usr/bin/env bash

function escape_sed
{
  sed -e 's/\//\\\//g' -e 's/\&/\\\&/g'
}

_BASE_PROJ_PATH=$GOPATH/src/github.com/contd

if [ -x $1 ];then
	echo "Please give a name for the new project"
	exit 1
else
	_PROJ_NAME=$1
	_PROJ_PATH=$_BASE_PROJ_PATH/$_PROJ_NAME
	echo "Creating new go project: ${_PROJ_NAME}"
fi

mkdir $_PROJ_PATH
mkdir -p $_PROJ_PATH/{cmd,pkg}
mkdir -p $_PROJ_PATH/cmd/{cli,server}
mkdir -p $_PROJ_PATH/pkg/{api,fs,merge}

touch $_PROJ_PATH/{circle.yml,Dockerfile}
touch $_PROJ_PATH/cmd/{cli,server}/main.go
touch $_PROJ_PATH/pkg/api/{api.go,api_test.go}
touch $_PROJ_PATH/pkg/fs/{fs.go,fs_test.go,moch.go,moch_test.go}
touch $_PROJ_PATH/pkg/merge/{merge.go,merge_test.go}

echo "Finished creating project skeleton."

exit 0
