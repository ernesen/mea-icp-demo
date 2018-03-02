# Helm Classic: A Kubernetes Package Manager
# http://helm.readthedocs.io/en/latest/

# Cheatsheet: Setting up Helm
# http://minimalist-jupyterhub.readthedocs.io/en/latest/cheat-setup-helm.html

# Discover & launch great Kubernetes-ready apps
# https://hub.kubeapps.com/

# https://bitnami.com/stacks
# https://hub.kubeapps.com/charts

# https://github.com/kubeapps/

# https://github.com/kubernetes-helm/monocular/tree/master/deployment/monocular

# https://github.com/prydonius/todomvc

heml init

helm init --upgrade

# check all the pods running with namespace monitoring
kubectl get po -n monitoring

helm version

helm search

helm list

helm repo add

helm repo list

kubectl get svc -w <serviceName>

helm -h

helm install stable/nginx-ingress

helm delete nginx-ingress

helm history <releaseName>

helm status <releaseName>

helm repo update

minikube addons enable ingress 

helm inspect stable/mariadb





