#!/bin/bash

if [ "$1" = "" ]; then
    echo "Please specify version for image."
    exit
fi

docker build -t michaelkryukov/cicd-utilities:${1} .
docker build -t michaelkryukov/cicd-utilities:latest .

if ! docker run --rm -v "`pwd`:/root" michaelkryukov/cicd-utilities:latest /root/test.sh; then
    echo "Failed while testing image"
    exit
else
    echo 'OK'
fi

docker push michaelkryukov/cicd-utilities:${1}
docker push michaelkryukov/cicd-utilities:latest
