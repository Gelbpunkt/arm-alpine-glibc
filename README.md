Alpine GNU C library (glibc) Docker image
=========================================

This is a collection of Dockerfiles to be built in order to get a alpine glibc image for the current architecture.

To build the image, run `./run.sh`. It will be built as frolvlad/alpine-glibc, as that's the inspiration for this image, but is only available for x86_64.

Usage Example
-------------

This image is intended to be a base image for your projects, so you may use it like this:

```Dockerfile
FROM frolvlad/alpine-glibc

COPY ./my_app /usr/local/bin/my_app
```

```sh
$ podman build -t my_app .
```
