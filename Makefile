TAG?=latest

all: diego-golang-ci diego-inigo-ci diego-docker-app deploy-cf-deployment

.PHONY: diego-golang-ci diego-inigo-ci diego-docker-app deploy-cf-deployment

push:
	docker push cloudfoundry/diego-golang-ci
	docker push cloudfoundry/diego-inigo-ci
	docker push cloudfoundry/diego-docker-app

diego-golang-ci: diego-golang-ci/Dockerfile
	docker build -t cloudfoundry/diego-golang-ci:${TAG} --rm diego-golang-ci

diego-inigo-ci: diego-inigo-ci/Dockerfile
	cd inigo-ci && make TAG=${TAG}

deploy-cf-deployment: deploy-cf-deployment/Dockerfile
	docker build -t cloudfoundry/deploy-cf-deployment:${TAG} --rm deploy-cf-deployment

diego-docker-app: diego-docker-app/Dockerfile
	cd diego-docker-app && make TAG=${TAG}
