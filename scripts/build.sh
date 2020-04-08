#!/bin/bash

set -o errexit

build_locally() {
  DEST="pkg/linux_amd64"
  NAME="nomad-driver-rkt"

  mkdir -p "${DEST}"
  echo "===> Building rkt driver binary"
  echo
  go build -o "${DEST}/${NAME}" .

  echo
  echo "binary is present in ${DEST}/${NAME}"
}

case "${OSTYPE}" in
  darwin*) ./scripts/build-in-docker.sh ;;
  linux*)  build_locally ;;
  *)
    echo "${OSTYPE} is not supported"
    exit 1
    ;;
esac
