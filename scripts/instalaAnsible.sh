#!/bin/bash
sudo apt-add-repository -y ppa:ansible/ansible
sudo apt update
sudo apt install -y software-properties-common ansible
ansible --version
