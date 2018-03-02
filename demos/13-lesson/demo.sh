kubectl set image deployment <deployment> <container>=<image>
kubectl rollout history deployment <deployment>
kubectl rollout undo deploy/<deployment>


kubectl get nodes
# Check out the source code from Github
git clone https://github.com/ernesen/icp-tech-talks.git | cd icp-tech-talks

sudo apt-get install ngrok-client

# Build and Push Docker Image
docker build . -t icp-tech-talks
docker run -d -p80:80 --name icp-tech-talks icp-tech-talks
docker tag icp-tech-talks ernesen/icp-tech-talks
docker login -u ernesen -p $PASSWORD
docker push ernesen/icp-tech-talks

# Deploy to ICP/Kubernetes
kubectl create deployment icp-tech-talks --image ernesen/icp-tech-talks
kubectl expose deployment icp-tech-talks --port=80 --name=techtalk4svc --type=LoadBalancer

# Configure Jenkins 
	# Update Jenkins URL
	# Add Webhook endpoint
	# Add Docker Hub password

# Configure Github
	# Add URL http://<Jenkins_IP>:8080/github-webhook/

# Create new Job in Jenkins
	# Add Github Repo
	
# Jenkins Build Configure
IMAGE_NAME"ernesen/techtalk4:${BUILD_NUMBER}"
docker build . -t $IMAGE_NAME
docker login -u ernesen -p ${DOCKER_HUB}
docker push $IMAGE_NAME

# Deploy to Kubernetes/ICP
IMAGE_NAME"ernesen/techtalk4:${BUILD_NUMBER}"
kubectl set image deployment/techtalk4 techtalk4=$IMAGE_NAME

# Check deployment history
kubectl rollout history deployment/techtalk4


kubectl create -f mongo-deploy.yaml -f  mongo-service.yaml -f myemp-deploy.yaml -f myemp-service.yaml

http://192.168.27.100:31001

http://192.168.27.100:31001/github-webhook/

helm install --name myemp myemp

##########################################
# 
cd ~/.kube 
sudo cp ./config /home/jenkins/.kube/
sudo cp ./config /var/lib/jenkins/.kube/
service jenkins restart




##########################################

