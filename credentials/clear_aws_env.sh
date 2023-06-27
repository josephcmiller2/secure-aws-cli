#!/bin/bash

CPATH=$(realpath $(dirname "$0"))
IFS="\n"
ENV_NAME="$1"

function usage() {
    echo -e "\n\t source $0 ENV_NAME\n"
}

function clear_encrypted_var() {
    VAR_FILENAME="$1"
    VAR_NAME="${VAR_FILENAME%.gpg}"
    VAR_NAME="${VAR_NAME#ENV_}"

    echo "Unsetting ${VAR_NAME}"
    #read -s "${VAR_NAME}" < <(gpg -q -d "${VAR_FILENAME}")
    unset $VAR_NAME
    export $VAR_NAME
}

function main() {

    if [[ ! -d "${ENV_NAME}" ]]; then
        usage "$@"
	exit 1
    fi

    cd "${ENV_NAME}"
    for file in *; do
        clear_encrypted_var "${file}"
    done

    cd "${CPATH}"
}

main "$@"

