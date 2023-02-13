TAG?=latest

all: diego-inigo-test-rootfs.tar
	docker build -t cloudfoundry/diego-inigo-ci:${TAG} --rm .
	rm diego-inigo-test-rootfs.tar

diego-inigo-test-rootfs.cid:
	docker build -t diego-inigo-test-rootfs --rm test-rootfs
	docker run --cidfile=diego-inigo-test-rootfs.cid diego-inigo-test-rootfs echo

diego-inigo-test-rootfs.tar: diego-inigo-test-rootfs.cid
	docker export `cat diego-inigo-test-rootfs.cid` > diego-inigo-test-rootfs.tar
	docker rm `cat diego-inigo-test-rootfs.cid`
	rm diego-inigo-test-rootfs.cid
