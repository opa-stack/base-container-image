FROM centos:8

LABEL maintainer="lars.solberg@gmail.com"

ENV UPDATED=2020-02-21 \
    PYTHONIOENCODING=utf-8 \
    S6_VERSION=v1.22.1.0 \
    S6_BEHAVIOUR_IF_STAGE2_FAILS=2

COPY root /

RUN /bin/sh /build/build-all base

ONBUILD COPY build /build
ONBUILD RUN /bin/sh /build/build-all

ENTRYPOINT ["/init"]

