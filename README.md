# Diego-Dockerfiles

Various docker images used on the diego project.

#### Updating the diego docker images

1. Start Docker

1. cd diego-dockerfiles.

1. `make` the appropriate docker image from the list below
   - `all`
   - `golang-ci`
   - `inigo-ci`
   - `diego-units-ci`
   - `diego-docker-app`
   - `diego-docker-app-custom`

1. Push the docker image into dockerhub
   - `make push`: to push all the images
   - `docker push [IMAGE]`: to push a specific image

