#!/usr/bin/env bash

set -e

# Cleanup
rm -rf $PWD/release

# Create release folder
mkdir -p $PWD/release

# Run build
docker build -t custom-caddy-build .

# Copy release
docker run -v $PWD/release:/opt/mount --rm -ti custom-caddy-build bash -c "cp /tmp/caddy-build/caddy /opt/mount/"
