#!/bin/bash

scriptDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source $scriptDir/installOperators.sh

install_operator openshift-gitops-operator 
install_operator openshift-pipelines-operator
