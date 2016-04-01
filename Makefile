TAG?=latest

all: golang-ci with-volume inigo-ci diego-docker-app diego-docker-app-custom

.PHONY: golang-ci warden-ci with-volume inigo-ci diego-docker-app diego-docker-app-custom

push:
	docker push cloudfoundry/golang-ci
	docker push cloudfoundry/warden-ci
	docker push cloudfoundry/with-volume
	docker push cloudfoundry/inigo-ci
	docker push cloudfoundry/diego-docker-app
	docker push cloudfoundry/diego-docker-app-custom

golang-ci: golang-ci/Dockerfile
	docker build -t cloudfoundry/golang-ci:${TAG} --rm golang-ci

with-volume: with-volume/Dockerfile
	docker build -t cloudfoundry/with-volume:${TAG} --rm with-volume

warden-ci: warden-ci/Dockerfile
	cd warden-ci && make TAG=${TAG}

inigo-ci: inigo-ci/Dockerfile
	cd inigo-ci && make TAG=${TAG}

diego-docker-app: diego-docker-app/Dockerfile
	cd diego-docker-app && make TAG=${TAG}

diego-docker-app-custom: diego-docker-app-custom/Dockerfile
	cd diego-docker-app-custom && make TAG=${TAG}
