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

2. The IBM Cloud tool installed: https://www.ibm.com/cloud/cli

3. The IBM Cloud Container Plugin installed: ibmcloud plugin install container-registry -r Bluemix

Then:

1. Create a free container registry on the IBM Cloud: https://cloud.ibm.com/kubernetes/catalog/registry?bss_account=4b5f219cdaee498f9dac672a8966c254

2. Create a namespace "myns" in the container registry

3. Create a free cluster "mycluster" on IBM Cloud: https://cloud.ibm.com/kubernetes/catalog/cluster?bss_account=4b5f219cdaee498f9dac672a8966c254

Then:

1. git clone https://github.com/romeokienzler/DockerSSHOnly.git

2. cd DockerSSHOnly

3. ibmcloud login -a https://cloud.ibm.com -r us-south -g default

3. ibmcloud cr build -t us.icr.io/myns/sshonly:latest .

4. ibmcloud cs cluster-config mycluster

5. run the generated *export* command like
export KUBECONFIG=/Users/romeokienzler/.bluemix/plugins/container-service/clusters/mycluster/kube-config-hou02-mycluster.yml

6. run it: kubectl run sshonly-deployment --image=us.icr.io/myns/sshonly:latest

7. export the ssh port: kubectl expose deployment/sshonly-deployment --type=NodePort --port=22 --name=sshyonly-service --target-port=22

8. get the port and ip: kubectl describe service sshyonly-service

9. ssh to the cluster: ssh -p 30505 root@184.172.242.248

