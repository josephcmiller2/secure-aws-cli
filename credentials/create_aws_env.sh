#!/bin/bash

CPATH=$(realpath $(dirname "$0"))
ENV_NAME="$1"

function usage() {
    echo -e "\n\t source $0 ENV_NAME\n"
}

function create_env() {
    mkdir "${ENV_NAME}"
    cd "${ENV_NAME}"

    # Create the environment variables
    while true; do
        read -p "Enter the name of a variable: " VAR_NAME
        if [[ -z "${VAR_NAME}" ]]; then
            break
        fi
        echo "Enter the value of the variable. Enter Ctrl+D on an empty line to finish."
        gpg -q -c -o "ENV_${VAR_NAME}.gpg" -
        if [[ $? -eq 0 ]]; then
            echo "Successfully encrypted the variable!"
        else
            echo "ERROR! Failed to encrypt the variable!"
            exit 1
        fi
        echo ""
    done
}

function main() {

    MYDIR=$(pwd)

    if [[ -z "${ENV_NAME}" ]]; then
        usage "$@"
        exit 1
    fi

    if [[ -e "${ENV_NAME}" ]]; then
        echo -e "\nERROR! The environment '${ENV_NAME}' already exists!"
        usage "$@"
        exit 1
    fi

    create_env

    cd "${MYDIR}"

    exit 0
}

main "$@"
