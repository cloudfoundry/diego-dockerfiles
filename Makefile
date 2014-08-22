TAG?=latest

all: golang-ci diego-ci warden-ci inigo-ci

.PHONY: golang-ci diego-ci warden-ci inigo-ci

push:
	docker push cloudfoundry/golang-ci
	docker push cloudfoundry/diego-ci
	docker push cloudfoundry/warden-ci
	docker push cloudfoundry/inigo-ci

golang-ci: golang-ci/Dockerfile
	docker build -t cloudfoundry/golang-ci:${TAG} --rm golang-ci

diego-ci: diego-ci/Dockerfile
	docker build -t cloudfoundry/diego-ci:${TAG} --rm diego-ci

warden-ci: warden-ci/warden-test-rootfs.tar
	docker build -t cloudfoundry/warden-ci:${TAG} --rm warden-ci
	rm warden-ci/warden-test-rootfs.tar

inigo-ci: inigo-ci/inigo-test-rootfs.tar
	docker build -t cloudfoundry/inigo-ci:${TAG} --rm inigo-ci
	rm inigo-ci/inigo-test-rootfs.tar

warden-ci/warden-test-rootfs.cid: warden-ci/test-rootfs/Dockerfile
	docker build -t cloudfoundry/warden-test-rootfs --rm warden-ci/test-rootfs
	docker run --cidfile=warden-ci/warden-test-rootfs.cid cloudfoundry/warden-test-rootfs echo

warden-ci/warden-test-rootfs.tar: warden-ci/warden-test-rootfs.cid
	docker export `cat warden-ci/warden-test-rootfs.cid` > warden-ci/warden-test-rootfs.tar
	docker rm `cat warden-ci/warden-test-rootfs.cid`
	rm warden-ci/warden-test-rootfs.cid

inigo-ci/inigo-test-rootfs.cid:
	docker run --cidfile=inigo-ci/inigo-test-rootfs.cid cloudfoundry/lucid64 echo

inigo-ci/inigo-test-rootfs.tar: inigo-ci/inigo-test-rootfs.cid
	docker export `cat inigo-ci/inigo-test-rootfs.cid` > inigo-ci/inigo-test-rootfs.tar
	docker rm `cat inigo-ci/inigo-test-rootfs.cid`
	rm inigo-ci/inigo-test-rootfs.cid
