#!/usr/bin/env bash

#privileged mode script
#when the server is up and running go to:
#http://localhost:1880

#gather stuff to install NodeJS
  
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
apt update
apt install nodejs

sleep 1

#use npm to install node-red

npm install -g --unsafe-perm node-red

sleep 1

#install mongodb connector

npm install -g --unsafe-perm node-red-node-mongodb
