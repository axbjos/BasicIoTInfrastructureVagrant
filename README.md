# Basic IoT Infrastructure Using Vagrant v1.0.0

Uses the Vagrant desktop hypervisor automation tool to create a basic IoT infrastructure.

## Description

The Vagrant automation creates the following:

Mosquitto MQTT Message Queue
IBM Node-Red Flow/Event-Based Programming Tool
MongdoDB NoSQL database for storing IoT data.

Any desktop hypervisor can be used: VirtualBox, VMware Workstation/Fusion, Hyper-V provided that Vagrant has a provider for it.  This automation code has been tested with MacOS/VMware Fusion and Windows/VirtualBox

If using VirtualBox I believe you must use VirtualBox 6.0.  There are incompatibilities with Vagrant and VirtualBox 6.1.

## Infrastructure

This automation will create three virtual machines each with 1GB RAM, 1 CPU, and 20GB HDD's.  Ensure your host has the resources to run all three VM's.  An alternative version of this automation will eventually be created to use a single VM.  Or modify this code yourself!

All of the Virtual Machines will be created on a NAT virtual network on the host machine - providing internet access for installing software.  Each VM will also have a port forward created through the NAT gateway on the host.  Rather than dealing with and remembering three separate IP addresses for each VM, by doing a port forward from the host IP, the user need to use the local IP address of host for connecting to the services. 

## Install a Hypervisor

Install the hypervisor of your choice.   Recommended is VirtualBox for a free open source solution (no $$$).  Use VMware Workstation (Windows) or Fusion (Mac) ($$$) if you want something a little more industrial-grade.

## Install Vagrant

Download Vagrant at https://www.vagrantup.com

Install the Vagrant package appropriate for your platform.

## Clone This Repository

Clone this repository to your computer.  Make sure the directory that is created is NOT sync'd to cloud storage like OneDrive or DropBox.   Vagrant will be automatically downloading and running Virtual Machines from this directory will consume many gigabytes of storage.  Your cloud sync provider will also attempt to continuously update your cloud storage since the Virtual Machines hard disk will look like a constantly changing file.  This will lead to Virtual Machine and cloud storage problems.

## Vagrant Files

From the command line, change directory into the directory created by the repo clone.

There should be five files present:

**Vagrantfile** - the main file that uses Ruby syntax to define virtual machines and configuration/provisioning options.

This is an example of an Infrastructure as Code tool.  Ruby is used as a declarative lanaguage to define the end-state of infrastructure.  There are three sections in the code that is each resposible for defining a particular server.

**mongo.sh
**mqtt.sh
**nodered.sh

These shell scripts are ran by Vagrant after the virtual machines are created.  There is a shell script for each server created.  These scripts install and configure the software for each platform.

**mongod.conf

This file is transferred to the MongoDB server after the database is installed.  It has an update config that configures the server to bind to all network addresses.

Look for additional details and comments in file.

## Use Vagrant

Start up the servers by typing in the following command:

vagrant up

This will begin the process of provisioning.   If this is the first time provisioning these servers, Vagrant will download a specialized image of Ubuntu 18.04, create three VM's and start provisioning.

To stop the servers:

vagrant halt

To delete everything:

vagrant destroy

Consult the Vagrant documentation for additional details.
