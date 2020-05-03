#!/usr/bin/env bash

wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -

sleep 1
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list

sleep 1
sudo apt-get update
sudo apt-get install -y mongodb-org

sleep 1
sudo mv mongod.conf /etc/mongod.conf

sleep 1
sudo systemctl start mongod
sleep 1
sudo systemctl enable mongod
