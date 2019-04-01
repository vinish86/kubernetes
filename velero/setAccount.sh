export AZURE_SUBSCRIPTION_ID="azure_subsc"
export AZURE_TENANT_ID="azure_directory"
export AZURE_CLIENT_ID="applicationId"
export AZURE_CLIENT_SECRET="applicationSecretPassword"
export AZURE_RESOURCE_GROUP="azure_rg"

kubectl create secret generic cloud-credentials --namespace velero --from-literal AZURE_SUBSCRIPTION_ID=${AZURE_SUBSCRIPTION_ID} --from-literal AZURE_TENANT_ID=${AZURE_TENANT_ID} --from-literal AZURE_CLIENT_ID=${AZURE_CLIENT_ID} --from-literal AZURE_CLIENT_SECRET=${AZURE_CLIENT_SECRET} --from-literal AZURE_RESOURCE_GROUP=${AZURE_RESOURCE_GROUP}
