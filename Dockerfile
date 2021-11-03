FROM docker/compose:latest

RUN apk add --update-cache \
        bash \
        build-base \
        curl \
        g++ \
        gcc \
        git \
        libffi-dev \
        musl-dev \
        openssl-dev \
        postgresql-dev \
        python3 \
        python3-dev && \
    rm -rf /var/cache/apk/*

# NOTE: pip should be upgraded first and separatly
RUN python3 -m pip install --upgrade pip && \
    python3 -m pip install --upgrade setuptools wheel twine

WORKDIR /root
