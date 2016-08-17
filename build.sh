#!/usr/bin/env bash

IMAGE_NAME='freedomben/scalatra'
ARGS="-t ${IMAGE_NAME}"

if [ -n "$1" ]; then
  ARGS="${ARGS} -t ${IMAGE_NAME}:${1}"
fi

docker build ${ARGS} .
