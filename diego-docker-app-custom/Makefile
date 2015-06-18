TAG?=latest

all: dockerapp
	docker build -t cloudfoundry/diego-docker-app-custom:${TAG} .
	rm dockerapp

dockerapp: 
	GOARCH=amd64 GOOS=linux go build -o dockerapp ../diego-docker-app/dockerapp.go
