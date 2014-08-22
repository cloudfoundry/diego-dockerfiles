TAG?=latest

all: golang-ci diego-ci warden-ci inigo-ci inigodockertest

.PHONY: golang-ci diego-ci warden-ci inigo-ci inigodockertest

push:
	docker push cloudfoundry/golang-ci
	docker push cloudfoundry/diego-ci
	docker push cloudfoundry/warden-ci
	docker push cloudfoundry/inigo-ci
	docker push cloudfoundry/inigodockertest

golang-ci: golang-ci/Dockerfile
	docker build -t cloudfoundry/golang-ci:${TAG} --rm golang-ci

diego-ci: diego-ci/Dockerfile
	docker build -t cloudfoundry/diego-ci:${TAG} --rm diego-ci

warden-ci: warden-ci/Dockerfile
	cd warden-ci && make TAG=${TAG}

inigo-ci: inigo-ci/Dockerfile
	cd inigo-ci && make TAG=${TAG}

inigodockertest: inigodockertest/Dockerfile
	cd inigodockertest && make TAG=${TAG}
