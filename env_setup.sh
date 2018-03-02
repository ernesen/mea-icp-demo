#!/bin/sh

# 0) Docker already installed on from the initial install

# 1) Install kubernetes
curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.8.0/bin/linux/amd64/kubectl
chmod +x ./kubectl
mv ./kubectl /usr/local/bin/kubectl

# 5) Install helm
# https://github.com/kubernetes/helm/releases
# https://github.com/kubernetes/helm/blob/master/docs/install.md
wget https://storage.googleapis.com/kubernetes-helm/helm-v2.6.0-linux-amd64.tar.gz
tar -zxvf helm-v2.6.0-linux-amd64.tar.gz
mv linux-amd64/helm /usr/local/bin/helm