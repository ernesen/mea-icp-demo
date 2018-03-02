#!/bin/sh


# Initialize Helm and Install Tiller
helm init

#helm create myemp

helm install --name myemp myemp

helm del --purge myemp

# Config Management
# helm install --values development.yaml --kube-context=development ./myemp
