# DockerSSHOnly
A simple Docker Image with SSH remote access only support

# Build
chmod 755 start.sh
docker build -t="sshservice" .

# Start
docker run -P -d sshservice

# Test
## Using Linux
ssh -p `docker ps |grep sshservice|awk -F":" '{print $2}'|awk -F"-" '{print $1}'` root@localhost
## Using Mac/Windows
ssh -p `docker ps |grep sshservice|awk -F":" '{print $2}'|awk -F"-" '{print $1}'` root@192.168.99.100

# Push it to the Cloud
## Push it to IBM Bluemix Container Service

