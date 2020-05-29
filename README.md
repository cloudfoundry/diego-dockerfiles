# Diego-Dockerfiles

Various Docker images used on the Diego project.

#### Updating the Diego Docker images

1. Download and start Docker on your machine following [these instructions](https://docs.docker.com/machine/get-started/).

1. Clone this repository onto your machine and change into its root directory.

   ```
   git clone https://github.com/cloudfoundry-incubator/diego-dockerfiles.git && cd diego-dockerfiles
   ```

1. `make` the appropriate Docker image target from the list below (for example, `make golang-ci` to build the `golang-ci` Docker image). Alternatively, run `make all` to build all of the images. By default, images are created with the `latest` tag. To specify a different tag name, set the `TAG` environment variable to that tag name.

   - `diego-docker-app`
   - `diego-units-ci`
   - `golang-ci`
   - `inigo-ci`

1. Push the Docker image to Dockerhub:
   - To push all of the images, run `make push`.
   - To push a specific image, run `docker push <IMAGE>`.

## Reporting issues and requesting features

Please report all issues and feature requests in [cloudfoundry/diego-release](https://github.com/cloudfoundry/diego-release/issues).
