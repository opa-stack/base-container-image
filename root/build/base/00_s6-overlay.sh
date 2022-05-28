#!/bin/bash

yum install -y xz

curl -L --remote-name-all https://github.com/just-containers/s6-overlay/releases/download/${S6_VERSION}/s6-overlay-x86_64.tar.xz{,.sha256}
sha256sum -c s6-overlay-x86_64.tar.xz.sha256
if [[ $? != 0 ]]; then
  echo "Bad signature for downloaded s6-overlay package"
  exit 1
fi

tar -C / -Jxpf /build/s6-overlay-x86_64.tar.xz

rm -rf /build/s6-*

