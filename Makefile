TAG?=latest

all: golang-ci inigo-ci diego-units-ci diego-units-ci-privileged diego-docker-app diego-docker-app-custom diego-docker-app-debian deploy-cf-deployment

.PHONY: golang-ci inigo-ci diego-units-ci diego-docker-app diego-docker-app-custom diego-docker-app-debian deploy-cf-deployment

push:
	docker push cloudfoundry/golang-ci
	docker push cloudfoundry/inigo-ci
	docker push cloudfoundry/diego-units-ci
	docker push cfdiegodocker/diego-units-ci-privileged
	docker push cloudfoundry/diego-docker-app
	docker push cloudfoundry/diego-docker-app-custom
	docker push cfdiegodocker/diego-docker-app-debian

golang-ci: golang-ci/Dockerfile
	docker build -t cloudfoundry/golang-ci:${TAG} --rm golang-ci

inigo-ci: inigo-ci/Dockerfile
	cd inigo-ci && make TAG=${TAG}

diego-units-ci: diego-units-ci/Dockerfile
	docker build -t cloudfoundry/diego-units-ci:${TAG} --rm diego-units-ci

diego-units-ci-privileged: diego-units-ci-privileged/Dockerfile
	docker build -t cfdiegodocker/diego-units-ci-privileged:${TAG} --rm diego-units-ci-privileged

deploy-cf-deployment: deploy-cf-deployment/Dockerfile
	docker build -t cfdiegodocker/deploy-cf-deployment:${TAG} --rm deploy-cf-deployment

diego-docker-app: diego-docker-app/Dockerfile
	cd diego-docker-app && make TAG=${TAG}

diego-docker-app-custom: diego-docker-app-custom/Dockerfile
	cd diego-docker-app-custom && make TAG=${TAG}

diego-docker-app-debian: diego-docker-app-debian/Dockerfile
	cd diego-docker-app-debian && make TAG=${TAG}
