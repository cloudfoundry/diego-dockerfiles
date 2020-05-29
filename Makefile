TAG?=latest

all: golang-ci inigo-ci diego-units-ci diego-docker-app deploy-cf-deployment

.PHONY: golang-ci inigo-ci diego-units-ci diego-docker-app deploy-cf-deployment

push:
	docker push cloudfoundry/golang-ci
	docker push cloudfoundry/inigo-ci
	docker push cloudfoundry/diego-units-ci
	docker push cloudfoundry/diego-docker-app

golang-ci: golang-ci/Dockerfile
	docker build -t cloudfoundry/golang-ci:${TAG} --rm golang-ci

inigo-ci: inigo-ci/Dockerfile
	cd inigo-ci && make TAG=${TAG}

diego-units-ci: diego-units-ci/Dockerfile
	docker build -t cloudfoundry/diego-units-ci:${TAG} --rm diego-units-ci

deploy-cf-deployment: deploy-cf-deployment/Dockerfile
	docker build -t cfdiegodocker/deploy-cf-deployment:${TAG} --rm deploy-cf-deployment

diego-docker-app: diego-docker-app/Dockerfile
	cd diego-docker-app && make TAG=${TAG}
