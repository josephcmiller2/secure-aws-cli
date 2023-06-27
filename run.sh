#!/bin/sh

CPATH=$(realpath $(dirname "$0"))

. "${CPATH}/config"

EXTRAARGS="$EXTRAARGS -v ${CPATH}/credentials:/root/credentials:rw"


if [[ "$1" == "" ]]; then
    CMD=/usr/bin/startcontainer.sh
fi

podman run --hostname "${HOSTNAME}" --name "${NAME}" ${X11ARGS} ${FUSEARGS} ${SHAREDARGS} ${EXTRAARGS} "${TAGNAME}" /usr/sbin/init
podman exec ${RUNARGS} "${NAME}" "${CMD}" "$@"
podman stop "${NAME}"
podman rm "${NAME}"

