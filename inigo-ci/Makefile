TAG?=latest

all: inigo-test-rootfs.tar
	docker build -t cloudfoundry/inigo-ci:${TAG} --rm .
	rm inigo-test-rootfs.tar

inigo-test-rootfs.cid:
	docker build -t inigo-test-rootfs --rm test-rootfs
	docker run --cidfile=inigo-test-rootfs.cid inigo-test-rootfs echo

inigo-test-rootfs.tar: inigo-test-rootfs.cid
	docker export `cat inigo-test-rootfs.cid` > inigo-test-rootfs.tar
	docker rm `cat inigo-test-rootfs.cid`
	rm inigo-test-rootfs.cid
