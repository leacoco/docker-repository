FROM docker/whalesay:latest

RUN apt-get -y update && apt-get install -y fortunes
CMD bash -c /usr/games/fortune -a | cowsay
