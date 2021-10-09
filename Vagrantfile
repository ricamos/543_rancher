# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "base"
end

# vagrant up --provider=google
# VAGRANT_INFO=debug vagrant reload
# Customize these global variables

$GOOGLE_PROJECT_ID = "rancher-328402"
$GOOGLE_CLIENT_EMAIL = "68764251533-compute@developer.gserviceaccount.com "
$GOOGLE_JSON_KEY = "files/secret/rancher-328402-1a90efcca9c9.json"
$LOCAL_USER = "vagrant"
$LOCAL_SSH_KEY = "files/secret/key"

Vagrant.configure("2") do |config|

  config.vm.box = "google/gce"

  config.vm.provider :google do |google, override|
    google.google_project_id = $GOOGLE_PROJECT_ID
    #google.google_client_email = $GOOGLE_CLIENT_EMAIL
    google.google_json_key_location = $GOOGLE_JSON_KEY

    # Override provider defaults
    google.name = "rancher-manager"
    google.image = "ubuntu-1804-bionic-v20210928"
    google.machine_type = "n1-standard-1"
    google.zone = "us-central1-f"
    google.metadata = {'custom' => 'metadata', 'testing' => 'foobarbaz'}

    override.ssh.username = $LOCAL_USER
    override.ssh.private_key_path = $LOCAL_SSH_KEY
  end
end



