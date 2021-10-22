# -*- mode: ruby -*-
# vi: set ft=ruby :

$GOOGLE_PROJECT_ID = "rancher-328402"
$GOOGLE_CLIENT_EMAIL = "68764251533-compute@developer.gserviceaccount.com "
$GOOGLE_JSON_KEY = "files/secret/rancher-328402-1a90efcca9c9.json"
$LOCAL_USER = "vagrant"
$LOCAL_SSH_KEY = "files/secret/key"
#$EXTERNAL_IP = "104.154.34.113"
vms = {
  'rancher-manager' => {'EXTERNAL_IP' => '104.154.34.113','disk_size' => '10', 'zone' => 'us-central1-f', 'type' => 'n1-standard-1', 'image' => 'ubuntu-1804-bionic-v20210928'},
  'kube-master' => {'EXTERNAL_IP' => 'false','disk_size' => '50', 'zone' => 'asia-east1-b', 'type' => 'e2-standard-2', 'image' => 'ubuntu-1804-bionic-v20210928'},
  'kube-node01' => {'EXTERNAL_IP' => 'false','disk_size' => '300', 'zone' => 'southamerica-east1-b', 'type' => 'e2-standard-4', 'image' => 'ubuntu-1804-bionic-v20210928'},
  'kube-node02' => {'EXTERNAL_IP' => 'false','disk_size' => '300', 'zone' => 'southamerica-east1-b', 'type' => 'e2-standard-4', 'image' => 'ubuntu-1804-bionic-v20210928'},
}

Vagrant.configure("2") do |config|

  config.vm.box = "google/gce"

  vms.each do |name, conf|
    config.vm.define "#{name}" do |gce|

      gce.vm.provider :google do |google, override|
        google.google_project_id = $GOOGLE_PROJECT_ID
        #google.google_client_email = $GOOGLE_CLIENT_EMAIL
        google.google_json_key_location = $GOOGLE_JSON_KEY

        # Override provider defaults
        google.name = "#{name}"
        google.image = "#{conf["image"]}"
        google.machine_type = "#{conf["type"]}"

        google.zone = "#{conf["zone"]}"

        
        google.disk_size = "#{conf["disk_size"]}"
        google.autodelete_disk = true
        google.metadata = {'custom' => 'metadata', 'testing' => 'foobarbaz'}
        google.tags = ['https-server', 'http-server']
      
        google.external_ip = $EXTERNAL_IP 
        override.ssh.username = $LOCAL_USER
        override.ssh.private_key_path = $LOCAL_SSH_KEY

        if "#{name}" != 'rancher-manager' 
            gce.vm.provision :shell, path: "files/docker.sh"
        else
            gce.vm.provision "shell", path: "files/rancher-manager.sh"
        end


      end  
    end
  end
  #config.vm.provision "shell", path: "files/rancher-manager.sh"
end



