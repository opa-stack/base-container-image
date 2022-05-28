#!/bin/bash

# There is a bug in bash-4.4.19-8.el8_0.x86_64 that causes bash to exit with the error of
#   /usr/bin/cd: line 2: cd: too many arguments
# See https://github.com/just-containers/s6-overlay/issues/278 for bug-report
# dnf update -y --exclude=bash

dnf install -y epel-release
dnf install -y python39 git vim tmux

pip3 install -r /build/requirements.txt

