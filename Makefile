TAG?=latest

all: golang-ci inigo-ci diego-units-ci diego-docker-app diego-docker-app-custom

.PHONY: golang-ci inigo-ci diego-units-ci diego-docker-app diego-docker-app-custom

push:
	docker push cloudfoundry/golang-ci
	docker push cloudfoundry/inigo-ci
	docker push cloudfoundry/diego-units-ci
	docker push cloudfoundry/diego-docker-app
	docker push cloudfoundry/diego-docker-app-custom

golang-ci: golang-ci/Dockerfile
	docker build -t cloudfoundry/golang-ci:${TAG} --rm golang-ci

inigo-ci: inigo-ci/Dockerfile
	cd inigo-ci && make TAG=${TAG}

diego-units-ci: diego-units-ci/Dockerfile
	docker build -t cloudfoundry/diego-units-ci:${TAG} --rm diego-units-ci

diego-docker-app: diego-docker-app/Dockerfile
	cd diego-docker-app && make TAG=${TAG}

diego-docker-app-custom: diego-docker-app-custom/Dockerfile
	cd diego-docker-app-custom && make TAG=${TAG}
