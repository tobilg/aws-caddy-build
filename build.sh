#!/usr/bin/env bash

set -e

# Set OS (first script argument)
OS=${1:-linux}

# Set Caddy version (second script argument)
CADDY_VERSION=${2:-v2.6.2}

# Create release folders
mkdir -p $PWD/releases $PWD/temp_release

# Run build
docker build --build-arg OS=$OS --build-arg CADDY_VERSION=$CADDY_VERSION -t custom-caddy-build .

# Copy release from image to temporary folder
docker run -v $PWD/temp_release:/opt/mount --rm -ti custom-caddy-build bash -c "cp /tmp/caddy-build/* /opt/mount/"

# Copy release to releases
cp $PWD/temp_release/* $PWD/releases/

# Cleanup
rm -rf $PWD/temp_release
