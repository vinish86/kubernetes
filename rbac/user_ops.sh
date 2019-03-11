#!/bin/bash

USER=$1
NS=$2 
mkdir -p  ~/.kube/users
cd ~/.kube/users

openssl genrsa -out $USER.key 2048

echo "defaul group will be Ops. change accordingly"

openssl req -new -key $USER.key -out $USER.csr -subj "/CN=$USER/O=ops/O=example.org"

cp $USER.csr /etc/kubernetes/pki/
cp $USER.key /etc/kubernetes/pki/


openssl x509 -req -CA /etc/kubernetes/pki/ca.crt -CAkey /etc/kubernetes/pki/ca.key -CAcreateserial -days 730 -in /etc/kubernetes/pki/$USER.csr -out /etc/kubernetes/pki/$USER.crt

kubectl config set-credentials "$USER" --client-certificate="/etc/kubernetes/pki/$USER.crt" --client-key="/etc/kubernetes/pki/$USER.key"

kubectl config set-context "$USER-prod" --cluster=kubernetes  --user="$USER" --namespace="$NS"
