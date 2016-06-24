#!/bin/bash

declare VERSION="1.0.0"
declare DOCKER_HOST
declare -a IMAGES_IN_USE
declare -a CONTAINERS_TO_DELETE

function docker() {
	if [ -z "$DOCKER_HOST" ]; then
		command "docker" "$@"
	else
		command "docker" -H "$DOCKER_HOST" "$@"
	fi
}

#docker

echo $@
echo "####"
echo $*

echo "####"
echo $#
