oc get catalogsource  ibm-operator-catalog -n openshift-marketplace
#echo $notfound
if [[ $? ]]
then
 echo "Define IBM catalog in openshift marketplace"
 oc apply -f https://raw.githubusercontent.com/ibm-cloud-architecture/eda-gitops-catalog/main/ibm-catalog/catalog-source.yaml
 oc apply -f https://raw.githubusercontent.com/ibm-cloud-architecture/eda-gitops-catalog/main/ibm-catalog/open-catalog.yaml
fi
