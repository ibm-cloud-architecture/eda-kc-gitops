#!/bin/bash

scriptDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source $scriptDir/installOperators.sh

install_operator ibm-eventstreams
install_operator ibm-mq