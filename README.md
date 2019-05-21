# DockerSSHOnly
A simple Docker Image with SSH remote access only support

# Build
docker build -t sshservice .

# Start
docker run -P -d sshservice

# Test
## Using Linux
ssh -p `docker ps |grep sshservice|awk -F":" '{print $2}'|awk -F"-" '{print $1}'` root@localhost
## Using Mac/Windows
ssh -p `docker ps |grep sshservice|awk -F":" '{print $2}'|awk -F"-" '{print $1}'` root@192.168.99.100

# Push it to the Cloud
## Push it to IBM Cloud Container Service
Prerequisites:
1. An IBM Cloud Account: http://ibm.biz/coursera

2. The CF tool and IC plugin installed: https://www.ng.bluemix.net/docs/containers/container_cli_cfic.html

cf login

cf ic login

docker tag sshservice registry.ng.bluemix.net/yourRegistry/sshservice

docker push registry.ng.bluemix.net/yourRegistry/sshservice


