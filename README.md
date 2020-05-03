# Basic IoT Infrastructure Using Vagrant v1.0.0

Uses the Vagrant desktop hypervisor automation tool to create a basic IoT infrastructure.

## Description

The Vagrant automation creates the following:

* Mosquitto MQTT Message Queue server
* IBM Node-Red Flow/Event-Based Programming Environment server
* MongdoDB NoSQL database server for storing IoT data.

Any desktop hypervisor can be used: VirtualBox, VMware Workstation/Fusion, or Hyper-V provided that Vagrant has a provider for it.  This automation code has been tested with MacOS/VMware Fusion and Windows/VirtualBox

If using VirtualBox I believe you must use VirtualBox 6.0.  Last I checked there were incompatibilities with Vagrant and VirtualBox 6.1.

## Infrastructure

This automation will create three virtual machines each with 1GB RAM, 1 CPU, and 20GB HDD's.  Ensure your host has the resources to run all three VM's. You Dunwoody laptop should work awesomely. An alternative version of this automation will eventually be created to use a single VM.  Or modify this code to be single server yourself!

All of the Virtual Machines will be created on the NAT virtual network on the host machine - providing internet access for installing software.  Each VM will also have a port forward created through the NAT gateway on the host.  Rather than dealing with and remembering three separate IP addresses for each VM, by doing a port forward from the host IP, the user only needs to use the local IP address of host for connecting to the services. 

## Install a Hypervisor

Install the hypervisor of your choice.   Recommended is VirtualBox for a free open source solution (no $$$).  Use VMware Workstation (Windows) or Fusion (Mac) (yes $$$) if you want something a little more industrial-grade.

## Install Vagrant

Download Vagrant at https://www.vagrantup.com

Install the Vagrant package appropriate for your platform.

## Clone This Repository

Clone this repository to your computer.  Make sure the directory that is created is NOT sync'd to cloud storage like OneDrive or DropBox.   Vagrant will be automatically downloading and running Virtual Machines in this directory and will consume many gigabytes of storage.  Your cloud sync provider will also attempt to continuously update your cloud storage since the Virtual Machines' hard disks will look like a constantly changing files.  This will lead to potential Virtual Machine and cloud storage problems.

## Vagrant Files

From the command line, change directory into the directory created by the repo clone.

There should be eight files present:

**Vagrantfile** - the main file that uses Ruby syntax to define virtual machines and configuration/provisioning options.

This is an example of an Infrastructure as Code tool.  Ruby is used as a declarative lanaguage to define the end-state of infrastructure.  There are three sections in the code that is each resposible for defining a particular server.

**Shell Scripts**
* mongo.sh
* mqtt.sh
* nodered1.sh
* nodered2.sh

These shell scripts are ran by Vagrant after the virtual machines are created.  There is a shell script for each server created.  These scripts install and configure the software for each platform.  The Node Red server has two provisioning scripts.  The first one is ran as sudo by Vagrant.  The other is ran as a non-privileged user.

**Mongo Config**
* mongod.conf

This file is transferred to the MongoDB server after the database is installed.  It has an update config that configures the server to bind to all network addresses.

Look for additional details and comments in file.

## Use Vagrant: vagrant up

Start up the servers by typing in the following command:

vagrant up

If using VMware, specify a provider:

vagrant up --provider=vmware_fusion

This will begin the process of provisioning.   If this is the first time provisioning these servers, Vagrant will download a specialized image of Ubuntu 18.04, create three VM's and start provisioning.

To stop the servers:

vagrant halt

To delete everything:

vagrant destroy

Consult the Vagrant documentation for additional details.

Since this is a multi-machine configuration, do can connect to each machine by:

* vagrant ssh mqtt
* vagrant ssh nodered
* vagrant ssh mongo

## Other Files

When the servers are up and running, start a new browser tab and go to:

http://localhost:1880

The Node Red programming environment should be displayed.

In the same directory as the Vagrant files is a file named iot-flow.json

Node Red uses json for its file definition.  iot-flow.json is a sample flow that connects to the MQTT server and the MongoDB server.

In the upper right near the "Deploy" button, click the hamburger menu item and import the iot-flow.json file.

A new tab will be created and the sample flow inside.  Take time to familiarize youself with what the flow does.

Deploy the flow by clicking "Deploy."   The MQTT In block and the MongoDB Out blocks should both say "connected."

This is a simple flow that subscribes to "temp" topics on the MQTT message queue and then stores the data in those messages in the MongoDB NoSQL database. The database name is "temperature" and the collection name is "temperature."

The "Debug" block allows the user to see messages in the Message Queue as they are generated. Click on the little Lady Bug icon in the upper right to bring up the Debug Viewer.

### The Python File

Also included is a sample "thing" Python file.  You must have Python 3 installed and the "paho-mqtt" module installed.   On Windows use:

pip install paho-mqtt

On Mac or Linux use:

pip3 install paho-mqtt

You can run this Python script on any system that can run Python.   The code simply connects to the message queue and then generates five simple "temperature readings" to the message queue.
