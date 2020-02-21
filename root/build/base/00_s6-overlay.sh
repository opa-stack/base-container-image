#!/bin/bash

curl https://keybase.io/justcontainers/key.asc | gpg --import
curl -L --remote-name-all https://github.com/just-containers/s6-overlay/releases/download/${S6_VERSION}/s6-overlay-amd64.tar.gz{,.sig}

gpg --verify s6-overlay-amd64.tar.gz.sig
if [[ $? != 0 ]]; then
  echo "Bad signature for downloaded s6-overlay package"
  exit 1
fi

# https://github.com/just-containers/s6-overlay#bin-and-sbin-are-symlinks
tar xzf /build/s6-overlay-amd64.tar.gz -C / --exclude="./bin"
tar xzf /build/s6-overlay-amd64.tar.gz -C /usr ./bin

rm -rf /build/s6-*

