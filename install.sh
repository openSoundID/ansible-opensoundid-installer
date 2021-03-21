#!/bin/bash
yum install epel-release -y
yum install ansible -y
ansible-playbook playbook-opensoundid-installer.yml
