#gcloud container clusters create kubelive
#gcloud container clusters get-credentials kubelive

kubectl run nginx --image=nginx --port=80
kubectl expose deployment nginx --target-port=80 --type=NodePort
kubectl apply -f nginx-ingress.yaml
# open 35.190.40.172

kubectl get ingress nginx-ingress
kubectl describe ingress nginx-ingress

# gcloud compute addresses create nginx-static-ip --global
kubectl apply -f nginx-ingress-ip.yaml
# open 35.190.40.172

kubectl run echoserver --image=gcr.io/google_containers/echoserver:1.4 --port=8080
kubectl expose deployment echoserver --target-port=80 --type=NodePort

kubectl create -f fanout-ingress.yaml
#open 130.211.8.161 & 130.211.8.161/echo

# Swith cluster
#gcloud container cluster get-credentials kubedemo



