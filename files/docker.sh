#!/bin/bash

docker_install(){
	echo -e "2.2 Install Rancher"
	apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common -y
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
	add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
	apt-get update
	apt-get install docker-ce docker-ce-cli containerd.io -y
}

main(){
	docker_install
}

main