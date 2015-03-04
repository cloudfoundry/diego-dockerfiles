TAG?=latest

all: warden-test-rootfs.tar ubuntu-test-rootfs.tar fuse-test-rootfs.tar docker-registry-test-rootfs.tar
	docker build -t cloudfoundry/warden-ci:${TAG} --rm .
	rm warden-test-rootfs.tar
	rm ubuntu-test-rootfs.tar
	rm fuse-test-rootfs.tar
	rm docker-registry-test-rootfs.tar

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

fuse-test-rootfs.cid: fuse-test-rootfs/Dockerfile
	docker build -t cloudfoundry/fuse-test-rootfs --rm fuse-test-rootfs
	docker run --cidfile=fuse-test-rootfs.cid cloudfoundry/fuse-test-rootfs echo

fuse-test-rootfs.tar: fuse-test-rootfs.cid
	docker export `cat fuse-test-rootfs.cid` > fuse-test-rootfs.tar
	docker rm `cat fuse-test-rootfs.cid`
	rm fuse-test-rootfs.cid

docker-registry-test-rootfs.cid:
	docker run --cidfile=docker-registry-test-rootfs.cid registry echo

docker-registry-test-rootfs.tar: docker-registry-test-rootfs.cid
	docker export `cat docker-registry-test-rootfs.cid` > docker-registry-test-rootfs.tar
	docker rm `cat docker-registry-test-rootfs.cid`
	rm docker-registry-test-rootfs.cid
