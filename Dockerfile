FROM amazonlinux:2

# Install dependencies
RUN yum update -y && \
  yum install golang -y

RUN GOBIN=/usr/local/bin/ go install github.com/caddyserver/xcaddy/cmd/xcaddy@latest

RUN mkdir -p /tmp/caddy-build && \
  xcaddy build --with github.com/silinternational/certmagic-storage-dynamodb/v3 --output /tmp/caddy-build
