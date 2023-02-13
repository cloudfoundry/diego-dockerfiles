TAG?=latest

all: diego-golang-ci diego-inigo-ci diego-units-ci diego-units diego-docker-app deploy-cf-deployment

.PHONY: diego-golang-ci diego-inigo-ci diego-units-ci diego-units diego-docker-app deploy-cf-deployment

push:
	docker push cloudfoundry/diego-golang-ci
	docker push cloudfoundry/diego-inigo-ci
	docker push cloudfoundry/diego-units-ci
	docker push cloudfoundry/diego-docker-app
	docker push cloudfoundry/diego-units-postgres
	docker push cloudfoudnry/diego-units-mysql

diego-golang-ci: diego-golang-ci/Dockerfile
	docker build -t cloudfoundry/diego-golang-ci:${TAG} --rm diego-golang-ci

diego-inigo-ci: diego-inigo-ci/Dockerfile
	cd inigo-ci && make TAG=${TAG}

diego-units-ci: diego-units-ci/Dockerfile
	docker build -t cloudfoundry/diego-units-ci:${TAG} --rm diego-units-ci

diego-units: diego-units/Dockerfile
	docker build --build-arg go_version="${GO_VERSION}" --build-arg sql_flavor="mysql:5" -t cloudfoundry/diego-units-mysql:${TAG} --rm diego-units
	docker build --build-arg go_version="${GO_VERSION}" --build-arg sql_flavor="postgres" -t cloudfoundry/diego-units-postgres:${TAG} --rm diego-units

deploy-cf-deployment: deploy-cf-deployment/Dockerfile
	docker build -t cloudfoundry/deploy-cf-deployment:${TAG} --rm deploy-cf-deployment

diego-docker-app: diego-docker-app/Dockerfile
	cd diego-docker-app && make TAG=${TAG}
