This project produces a Docker image to facilitate building application or RPM
packages off an instance of Amazon Linux 2. There isn't that much to customize:

 * `RELEASE` which is the revision number of the Docker file, such as adding
additional packages
 * `BASETAG` which is the tag of the underlying [amazonlinux image](https://hub.docker.com/_/amazonlinux).
It defaults to "2"

`make` builds the image, while `make push` performs a `docker push` of the image.
