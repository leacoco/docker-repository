include env_make
NS = devsoftcom
VERSION = latest

REPO = testmakefile
NAME = alpine-javatest
INSTANCE = default

.PHONY: build push

build:	Dockerfile
		docker build -t $(NS)/$(REPO):$(VERSION) .

push: push
		docker push $(NS)/$(REPO):$(VERSION)

run: run
		docker run -i -d --name=$(NAME) $(NS)/$(REPO):$(VERSION)

clean:
		docker rm -f $(docker ps -aq)
