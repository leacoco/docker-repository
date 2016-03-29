include env_make
NS = devsoftcom
Version = latest

REPO = testmakefile
NAME = alpine-javatest
INSTANCE = default

.PHONY: build push

build:	Dockerfile
		docker build -t $(NS)/$(REPO):$(Version) .

push: push
		docker push $(NS)/$(REPO):$(Version)

run: run
		docker run -i -d --name=$(NAME) $(NS)/$(REPO):$(Version)

clean: 
		docker rm -f $(docker ps -aq) 
