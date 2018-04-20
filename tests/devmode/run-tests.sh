#!/bin/bash

set -e
set -o pipefail
trap 'on_error $LINENO' ERR;
PROGNAME=$(basename $0)

function on_error () {
    echo "Error: ${PROGNAME} on line $1" 1>&2
    exit 1
}



docker build -t kickstart-test-erebos:testing ../../flavor/

./kickstart.sh -t kickstart-test-erebos:testing



