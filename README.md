# Batch processing of shapefiles

## Pre-requisites

A working `docker` installation.

## Usage

Build the docker image

    docker build -t mergeshapes .

To run the command against a set of geojson files located in a local directory.
You will need to mount this to `/data/input`. Similarly `/data/output` needs to
be mounted to recieve the resulting files, which will be named per the input
file, but with `.merged.geojson` as an extension.

The spec for the local directory needs to be an absolute path. On unix-ish
systems, you can use the following incantation to mount from the `data`
subdirectory of the local filesystem.

    docker run --rm \
      -v $(pwd)/data/input:/data/input \
      -v $(pwd)/data/output:/data/output mergeshapes

Run a shell in the container (prevents `script.sh` from running)

    docker run --rm -it mergeshapes /bin/sh

These two incantations can be combined to mount the directories and enable
problem determination.

## Cleaning up

If you rebuild frequently or fail to use the `--rm` flag, you'll end up with
loads of images and containers sitting on your disk.

Use the following to remove them

    docker container prune
    docker image prune
