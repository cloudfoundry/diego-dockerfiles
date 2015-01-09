TAG?=latest

all: golang-ci diego-ci warden-ci with-volume inigo-ci

.PHONY: golang-ci diego-ci warden-ci with-volume inigo-ci

push:
	docker push cloudfoundry/golang-ci
	docker push cloudfoundry/diego-ci
	docker push cloudfoundry/warden-ci
	docker push cloudfoundry/with-volume
	docker push cloudfoundry/inigo-ci

golang-ci: golang-ci/Dockerfile
	docker build -t cloudfoundry/golang-ci:${TAG} --rm golang-ci

diego-ci: diego-ci/Dockerfile
	docker build -t cloudfoundry/diego-ci:${TAG} --rm diego-ci

with-volume: with-volume/Dockerfile
	docker build -t cloudfoundry/with-volume:${TAG} --rm with-volume

warden-ci: warden-ci/Dockerfile
	cd warden-ci && make TAG=${TAG}

inigo-ci: inigo-ci/Dockerfile
	cd inigo-ci && make TAG=${TAG}
