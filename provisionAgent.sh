#!/bin/bash

# Required variable checks
SSH_USER=${SSH_USER?"Need to provide SSH_USER variable"}
SSH_PASS=${SSH_PASS?"Need to provide SSH_PASS variable"}
RANCHER_SERVER_HOST=${RANCHER_SERVER_HOST?"Need to provide RANCHER_SERVER_HOST variable"}
RANCHER_PORT=${RANCHER_PORT?"Need to provide RANCHER_PORT variable"}
RANCHER_AGENT_HOST=${RANCHER_AGENT_HOST?"Need to provide RANCHER_AGENT_HOST variable"}

export ANSIBLE_HOST_KEY_CHECKING=False

#install any ansible roles we may need
ansible-galaxy install --force ateoto.docker

ansible-playbook -u $SSH_USER -i $RANCHER_AGENT_HOST, --extra-vars "ansible_ssh_pass=$SSH_PASS rancher_server=$RANCHER_SERVER_HOST rancher_port=$RANCHER_PORT" provisioning/rancher-agent.yml
