# docker-case-studies

## Create network and set ip for container

docker network create --subnet=192.168.1.0/24 MyNetW

docker run --net MyNetW --ip 192.168.1.2 -it ubuntu bash

## Check
ip addr 

#Remove all container
docker rm $(docker ps -aq) -f

iptables -t nat -A PREROUTING -p tcp --dport 80 -j DNAT --to-destination 192.168.1.2:80

iptables -t nat -A POSTROUTING -p tcp -d 192.168.1.2 --dport 80 -j SNAT --to-source 192.168.1.2
