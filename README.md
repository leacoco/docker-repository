This is a bash script for helper functions to use in Docker
Some kind of Docker Housekeeping


dockerCleanup() {
	docker rm $(docker ps --filter status=exited -q 2>/dev/null) 2>/dev/null

	docker rmi $(docker images --filter dangling=true -q 2>/dev/null) 2>/dev/null
}

docker_del_stopped() {
	local name=$1
	local state=$(docker inspect --format "{{.State.Running}}" $name 2>/dev/null)

	if [[ "state" == "false" ]]; then
		docker rm $name
	fi
}

docker_Relies_on() {
	local containers=$@

	for container in $containers; do
		local state=$(docker inspect --format "{{.State.Running}}" $container 2>/dev/null)

		if [[ "$state" == "false"]] || [[ "$state" == "" ]]; then
			echo "$container is not running. Starting it for you."
			$container
		fi
	done
}

##container aliases

apt_file() {
	docker run --rm -it --name apt-file jess/apt-file
}

alias apt-file="apt_file"

container_advisor() {
	docker run -d \
		-v /:/rootfs:ro \
		-v /var/run:/var/run:rw \
		-v /sys:/sys:ro \
		-v /var/lib/docker/:/var/lib/docker:ro \
		-p 1212:8080 \
		--name cadvisor \
		google/cadvisor

		browser-exec "http://127.0.0.1:1212"
}

document_server() {
	docker_del_stopped documentserver

	docker run --rm -it \
		-p 1234:80 \
		-v $HOME/slides:/slides \
		--name documentserver \
		onlyoffice/documentserver

		browser-exec "http://127.0.0.1:1234/"
}

http() {
	docker run -t --rm \
		-v /var/run/docker.sock:/var/run/docker.sock \
		--log-driver none \
		jess/httpie "$@"
}


libreoffice() {
	docker_del_stopped libreoffice

	docker run -d \
		-v /etc/localtime:/etc/localtime:ro \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		-e DISPLAY=unix$DISPLAY \
		-v $HOME/slides:/root/slides \
		-e GDK_SCALE \
		-e GDK_DPI_SCALE \
		--name libreoffice \
		jess/libreoffice
}



 #################################### A sample shell script ####################

 # find the Public Ip address:

 alias myip='curl -s "http://checkip.dyndns.org/" | egrep -o "[0-9]*\.[0-9]*\.[0-9]*\.[0-9]*"| head -1'
 ## set the env variable accourding to public ip

 case $(myip) in 
 	x.x.x.x ) SERVER="dev";;
 	y.y.y.y ) SERVER="live";;
 	* ) SERVER="";;
 esac

 if [ $# -eq 0 ]
 	then
 		docker build -t myapp:latest .
 else
 		docker build -t myapp:$1
 		docker tag -f myapp:$1 myapp:latest
 fi


#### Docker compose tips for scripting
```
if [ "$OPERATION" = "build" ]; then
	CMD="docker-compose -p plattform -f $FILE build $COMPONENT"
elif [ "OPERATION" = "stop" ]; then
	CMD="docker-compose -p plattform -f $FILE stop -t 30 $COMPONENT && docker-compose -p plattform -f $FILE rm --force -v $COMPONENT"
elif [ "OPERATION" = "start" ]; then
	CMD="docker-compose -p platform -f $FILE up --no-recreate -d $COMPONENT"
fi
```
