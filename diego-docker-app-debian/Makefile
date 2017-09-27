TAG?=latest

all: dockerapp
	docker build -t cloudfoundry/diego-docker-app-debian:${TAG} .
	rm dockerapp

dockerapp:
	CGO_ENABLED=0 GOARCH=amd64 GOOS=linux go build -o dockerapp ../diego-docker-app/dockerapp.go
