FROM amazonlinux:2

ARG CADDY_VERSION=v2.6.2
ARG OS=linux

# Install dependencies
RUN yum update -y && \
  yum install golang -y

RUN GOBIN=/usr/local/bin/ go install github.com/caddyserver/xcaddy/cmd/xcaddy@latest

RUN mkdir -p /tmp/caddy-build && \
  GOOS=${OS} xcaddy build ${CADDY_VERSION} --with github.com/ss098/certmagic-s3 --with github.com/silinternational/certmagic-storage-dynamodb/v3 --output /tmp/caddy-build/aws_caddy_${CADDY_VERSION}_${OS}
