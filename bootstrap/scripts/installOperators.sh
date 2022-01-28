#!/bin/bash

scriptDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

install_operator() {
PRODUCT=$1
alreadyDefined=$(oc get -n openshift-operators subscription $PRODUCT 2> /dev/null)
if [[ -z "$alreadyDefined" ]]
then
    oc apply -k $scriptDir/../$PRODUCT
    wait_operator $PRODUCT
else
   echo "$PRODUCT already installed"
fi
}

wait_operator() {
echo "Waiting for operator $1 to be deployed..."
counter=0
desired_state="AtLatestKnown"
until [[ ("$(oc get -n openshift-operators subscription $1 -o jsonpath="{.status.state}")" == "${desired_state}") || ( ${counter} == 60 ) ]]
do
  ((counter++))
  echo -n "..."
  sleep 5
done
if [[ ${counter} == 60 ]]
then
  echo
  echo "[ERROR] - Timeout occurred while deploying the Operator"
  exit 1
else
  echo "Done"
fi
}



