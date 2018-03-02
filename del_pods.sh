#!/bin/sh

kubectl cordon 192.168.27.102
del_pod=`kubectl get pods --namespace=default | awk -F" " '{ print $1 }' | grep myemp`
arr=$(echo ${del_pod} | tr " " "\n")

for pod in $arr; do
  kubectl delete pod $pod
done


