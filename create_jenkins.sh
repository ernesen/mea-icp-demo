#!/bin/sh

docker run -d -p 31002:50000 -p 31001:8080 \
-v $(which docker):/usr/bin/docker \
-v /var/run/docker.sock:/var/run/docker.sock \
-v /usr/lib/x86_64-linux-gnu/libltdl.so.7:/usr/lib/x86_64-linux-gnu/libltdl.so.7:ro \
--name jenkins -u root --restart=always --privileged=true getintodevops/jenkins-withdocker:lts
