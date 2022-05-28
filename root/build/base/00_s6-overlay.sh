#!/bin/bash

yum install -y xz

packages="s6-overlay-noarch.tar.xz s6-overlay-symlinks-noarch.tar.xz s6-overlay-x86_64.tar.xz s6-overlay-symlinks-arch.tar.xz"

for i in ${packages}; do
  curl -L --remote-name-all https://github.com/just-containers/s6-overlay/releases/download/${S6_VERSION}/${i}{,.sha256}
done

sha256sum -c s6-overlay-*.sha256
if [[ $? != 0 ]]; then
  echo "Bad signature for downloaded s6-overlay package(s)"
  exit 1
fi

for i in ${packages}; do
  tar -C / -Jxpf /build/${i}
done

rm -rf /build/s6-*

