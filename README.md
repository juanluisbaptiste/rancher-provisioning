#Rancher server and agent configuration using Ansible

This repository contains Ansible playbooks for configuring Rancher Servers and Rancher Agents.

## Requirements
To run these playbooks you need to have ansible installed:
Ansible 1.9

### Variables

Playbooks are configured by passing in extra variables.  You need to pass in the environment variables in the --extra-vars option when running ansible-playbook.  See the provisionServer.sh, provisionAgent.sh and bootstrapProvisioner.sh scripts for examples.

For the server playbook you need to set the --extra-vars:
* RANCHER_SERVER
* RANCHER_PORT
* ADMIN_USER
* ADMIN_PASS

## Development environment

There is a development environment setup using Vagrant and Virtualbox.  This environment consists 3 boxes: a rancher server, a single agent and a machine to provision the former two using ansible.  

You will need to have the following software installed on your development machine: 
* Virtualbox (It works with >= 4 but i recommend 5 to maximise compatibility with the version of guest additions - version 5 -  installed on the vm)
* Vagrant (>= 1.7.4)

I suggest you use your native/favourite package manager to install these (for windows see [chocolately](https://chocolatey.org/), Mac OSX: [homebrew](), linux: apt-get :))


To create the environment run command in this directory:
```
vagrant up
```
This will provision the machines on first run

To reprovision the server and agent nodes run:
```
vagrant provision
```