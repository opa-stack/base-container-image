FROM rockylinux:8.5

LABEL maintainer="lars.solberg@gmail.com"

ENV UPDATED=2022-05-28 \
    PYTHONIOENCODING=utf-8 \
    S6_VERSION=v3.1.0.1 \
    S6_BEHAVIOUR_IF_STAGE2_FAILS=2

COPY root /

RUN /bin/sh /build/build-all base

ENTRYPOINT ["/init"]

