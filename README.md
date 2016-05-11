# Diego-Dockerfiles

Various docker images used on the diego project.

#### Updating the diego docker images

1. Download and start docker on your machine following [these instructions](https://docs.docker.com/machine/get-started/)

1. Clone this repository onto your machine.

   ```
   git clone https://github.com/cloudfoundry-incubator/diego-dockerfiles.git && cd diego-dockerfiles
   ```

1. `make` the appropriate docker image from the list below (e.g. `make golang-ci` to build an individual docker image). Alternatively, run `make all` for building all of the images. By default images are created with the `latest` tag. Setting the `TAG` environment variable can alter the tag under which the image gets created.
   - `golang-ci`
   - `inigo-ci`
   - `diego-units-ci`
   - `diego-docker-app`
   - `diego-docker-app-custom`

1. Push the docker image into dockerhub
   - `make push`: to push all the images
   - `docker push [IMAGE]`: to push a specific image
