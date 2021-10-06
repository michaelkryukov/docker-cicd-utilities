FROM docker/compose:latest

RUN apk add --update-cache \
        bash \
        build-base \
        curl \
        git \
        python3 \
        python3-dev && \
    rm -rf /var/cache/apk/*

WORKDIR /root
