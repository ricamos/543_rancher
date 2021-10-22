#!/bin/bash

docker_install(){
	echo -e "2.2 Install Docker"
	apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common -y
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
	add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
	apt-get update
	apt-get install docker-ce docker-ce-cli containerd.io -y
}

rancher_up(){
	echo -e "2.2 Install Rancher"
	#docker run -d --restart=unless-stopped -p 80:80 -p 443:443 rancher/rancher:v2.4.17
	echo -e "Editado de acordo com o Forum de suporte. \nhttps://moodle-prod.4linux.com.br/mod/forum/discuss.php?d=770"
	docker run -d --privileged --restart=unless-stopped -p 80:80 -p 443:443 rancher/rancher:v2.4.17
	docker container ls
}	

main(){
	docker_install
	rancher_up
}

main