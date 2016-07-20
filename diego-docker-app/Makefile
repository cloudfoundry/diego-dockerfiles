TAG?=latest

all: dockerapp
	docker build -t cloudfoundry/diego-docker-app:${TAG} .
	rm dockerapp

dockerapp: dockerapp.go
	CGO_ENABLED=0 GOARCH=amd64 GOOS=linux go build -o dockerapp dockerapp.go
