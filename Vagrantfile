# -*- mode: ruby -*-
# vi: set ft=ruby :
require 'yaml'

server_config = YAML.load_file("setup.yaml")

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.provision "shell", path: "provision/setup.sh"
  # network
  config.vm.network :private_network, ip: server_config["ip"]

  # mount point
  config.vm.synced_folder server_config["document_root"], "/var/www", owner: "www-data", group: "www-data", :mount_options => ['dmode=777,fmode=777']
  
# vm resources
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "4096"]
    vb.customize ["modifyvm", :id, "--cpus", "2"]
  end

  if !server_config["packages"].nil?
    server_config["packages"].each do |package|
      config.vm.provision "shell", inline: "apt-get install " + package + " -y &> /dev/null"
    end
  end
end
