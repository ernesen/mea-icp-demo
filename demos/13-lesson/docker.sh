docker run -p 8080:8080 -v /var/run/docker.sock:/var/run/docker.sock --name jenkins getintodevops/jenkins-withdocker:lts


docker run -d -p 31002:50000 -p 31001:8080 \
-v $(which docker):/usr/bin/docker \
-v /var/run/docker.sock:/var/run/docker.sock \
-v /usr/lib/x86_64-linux-gnu/libltdl.so.7:/usr/lib/x86_64-linux-gnu/libltdl.so.7:ro \
--name jenkins -u root --restart=always --privileged=true jenkins/jenkins:latest

admin/admin


ernesen/S6966748a

github
docker-hub-credentials

