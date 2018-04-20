#!/bin/bash

set -e
set -o pipefail
trap 'on_error $LINENO' ERR;
PROGNAME=$(basename $0)

function on_error () {
    echo "Error: ${PROGNAME} on line $1" 1>&2
    exit 1
}


if [ "$1" = "rebuild" ]
then
    docker build --no-cache -t kickstart-test-erebos:testing ../../flavor/
fi

echo "****************************************************************************************"
echo "****************************************************************************************"
echo "****************************************************************************************"
docker build -t testbuild .

echo "****************************************************************************************"
echo "****************************************************************************************"
docker run -p 80:80 -it testbuild




