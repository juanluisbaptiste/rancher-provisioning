#!/bin/bash

export RANCHER_SERVER_HOST=172.19.8.100
export RANCHER_AGENT_HOST=172.19.8.101
export SSH_PASS=vagrant
export SSH_USER=vagrant

# Main provisioning entry point
cd /vagrant/ && ./provision.sh
