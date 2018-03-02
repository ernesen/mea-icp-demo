#!/bin/sh

kubectl delete deployment myemp
kubectl delete deployment mongo

kubectl delete service mongo
kubectl delete service myemp

kubectl uncordon 192.168.27.101
kubectl uncordon 192.168.27.102


