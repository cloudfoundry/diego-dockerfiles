TAG?=latest

all: warden-test-rootfs.tar ubuntu-test-rootfs.tar
	docker build -t cloudfoundry/warden-ci:${TAG} --rm .
	rm warden-test-rootfs.tar
	rm ubuntu-test-rootfs.tar

warden-test-rootfs.cid: test-rootfs/Dockerfile
	docker build -t cloudfoundry/warden-test-rootfs --rm test-rootfs
	docker run --cidfile=warden-test-rootfs.cid cloudfoundry/warden-test-rootfs echo

warden-test-rootfs.tar: warden-test-rootfs.cid
	docker export `cat warden-test-rootfs.cid` > warden-test-rootfs.tar
	docker rm `cat warden-test-rootfs.cid`
	rm warden-test-rootfs.cid

ubuntu-test-rootfs.cid: ubuntu-test-rootfs/Dockerfile
	docker build -t cloudfoundry/ubuntu-test-rootfs --rm ubuntu-test-rootfs
	docker run --cidfile=ubuntu-test-rootfs.cid cloudfoundry/ubuntu-test-rootfs echo

ubuntu-test-rootfs.tar: ubuntu-test-rootfs.cid
	docker export `cat ubuntu-test-rootfs.cid` > ubuntu-test-rootfs.tar
	docker rm `cat ubuntu-test-rootfs.cid`
	rm ubuntu-test-rootfs.cid
