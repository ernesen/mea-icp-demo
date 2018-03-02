# Deploy to ICP/Kubernetes
kubectl create deployment mea-icp-demo --image ernesen/mea-icp-demo
kubectl expose deployment mea-icp-demo --port=80 --name=mea-icp-demo --type=NodePort
kubectl create -f myemp/mongo-deploy.yaml -f  myemp/mongo-service.yaml 

kubectl rollout history deployment/mea-icp-demo

# cordoning Node
kubectl get nodes
kubectl get pods -o wide

kubectl scale --replicas=5 deploy/myemp
kubectl get pods -o wide

kubectl cordon 192.168.27.102
kubectl scale --replicas=10 deploy/myemp
kubectl get pods -o wide

kubectl undordon 192.168.27.101
kubectl scale --replicas=20 deploy/myemp
kubectl get pods -o wide
kubectl scale --replicas=5 deploy/myemp

# Draining Node and move to another Node 
kubectl get pods -o wide
kubectl drain 192.168.27.102 --force
kubectl get pods -o wide

kubectl uncordon 192.168.27.101
kubectl scale --replicas=10 deploy/myemp
kubectl get pods -o wide

# Watching Pod Status
kubectl get pods --watch-only
kubectl scale --replicas=20 deploy/myemp
kubectl scale --replicas=5 deploy/myemp

# Port Forwarding 
kubectl get svc myemp
kubectl port-forward myemp 3000:3000

# Copying Files from Host
kubectl exec -it myemp /bin/sh
cd public
ls
kubectl cp ./test.html myemp:/usr/src/app/public/test.html
ls 
kubectl cp myemp:/usr/src/app/public/test.html ./test.html 

# Explain Objects
kubectl explain
kubectl explain po
kubectl explain scv

# Formart Output
kubectl get pod myemp -o=yaml
kubectl get pod myemp -o=json

# List Containers in a Pod
kubectl get pods myemp -o jsonpath={.spec.containers[*].name}

# Sort by Name
kubectl get services --sort-by=.metadata.name

# List Pods along with the Node
kubectl get pod -o wide | awk -F" " '{ print $1  " " $7 }' | column -t

# Edit Objects
kubectl edit pod/myemp
KUBE_EDITOR="sublime" kubectl edit pod/myemp

# Proxy
kubectl proxy
kubectl proxy --port=8000
open http://localhost:8000/ui
curl http://localhost:8000/api
curl -s http://localhost:8000/api/v1/nodes | jq '.items[] .metadata.labels'

# List exposed APIs
kubectl api-versions

# Create Pod and Service through API
kubectl get pods
curl -s http://localhost:8000/api/v1/namespaces/default/pods -XPOST -H 'Content-Type: application/json' -d@nginx-pod.json | jq '.status'
curl -s http://localhost:8000/api/v1/namespaces/default/pods -XPOST -H "Content-Type: application/json" -d@db-pod.json | jq ".status"
kubectl get pods
curl -s http://localhost:8000/api/v1/namespaces/default/services -XPOST -H 'Content-Type: application/json' -d@nginx-svc.json | jq '.spec.clusterIP'
curl -s http://localhost:8000/api/v1/namespaces/default/services -XPOST -H "Content-Type: application/json" -d@db-svc.json | jq ".spec.clusterIP"
kubectl get svc
curl http://localhost:8000/api/v1/namespaces/default/services/nginx-service -XDELETE
kubectl get svc
kubectl get pods
curl http://localhost:8000/api/v1/namespaces/default/pods/nginx -XDELETE
kubectl get pods  

curl nginx.default.svc.cluster.local:8080
