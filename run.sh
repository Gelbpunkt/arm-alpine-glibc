#!/usr/bin/bash
podman build -t glibc-builder:latest . -f Dockerfile.build
podman run --rm --name glibc-binary -e STDOUT=1 glibc-builder:latest 2.31 /usr/glibc-compat > glibc-bin.tar.gz
podman build -t glibc-packager:latest . -f Dockerfile.package
podman run --name glibc-package -d -e "PACKAGER=Jens Reidel <jens@troet.org>" --rm glibc-packager:latest
podman cp glibc-package:/home/packager/packages/packager/aarch64/ .
podman build -t frolvlad/alpine-glibc:latest . -f Dockerfile.run
