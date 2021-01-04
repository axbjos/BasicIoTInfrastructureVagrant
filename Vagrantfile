# -*- mode: ruby -*-
# vi: set ft=ruby :

#Vagrant Configure - Basic IoT Stack - Separate VM's
#mqtt message queue
#node-red event/flow based application logic server
#mongod NoSQL database for storing data

Vagrant.configure("2") do |config|
  config.vm.define "mqtt" do |mqtt|
    mqtt.vm.box = "ubuntu/bionic64"
    mqtt.vm.network :forwarded_port, guest: 1883, host: 1883
    mqtt.vm.provision :shell, path: "mqtt.sh"
    config.vm.provider "virtualbox" do |vb|
     # Display the VirtualBox GUI when booting the machine
     vb.gui = true
     # Customize the amount of memory on the VM:
     vb.memory = "1024"
    end
  end

  config.vm.define "nodered" do |nodered|
    nodered.vm.box = "ubuntu/bionic64"
    nodered.vm.network :forwarded_port, guest: 1880, host: 1880
    nodered.vm.provision :shell, path: "nodered1.sh"
    nodered.vm.provision :shell, privileged: false, path: "nodered2.sh"
    config.vm.provider "virtualbox" do |vb|
     # Display the VirtualBox GUI when booting the machine
     vb.gui = true
     # Customize the amount of memory on the VM:
     vb.memory = "2048"
    end
  end

#configure the mongodb.  run the mongo.sh provisioning script.
#set the port
#move an updated mongod.conf configuration file out to the server
#so that it listens on all network interfaces

  config.vm.define "mongo" do |mongo|
    mongo.vm.box = "ubuntu/bionic64"
    mongo.vm.network :forwarded_port, guest: 27017, host: 27017 
    mongo.vm.provision "file", source: "mongod.conf", destination: "mongod.conf"
    mongo.vm.provision :shell, path: "mongo.sh"
    config.vm.provider "virtualbox" do |vb|
     # Display the VirtualBox GUI when booting the machine
     vb.gui = true
     # Customize the amount of memory on the VM:
     vb.memory = "2048"
    end
  end
 
end
