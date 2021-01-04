#!/usr/bin/env bash
#send output of each command to /dev/null for reliability
sudo apt-get update
sleep 1
sudo apt-get install -y mosquitto mosquitto-clients
