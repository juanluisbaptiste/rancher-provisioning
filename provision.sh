apt-get update -y
apt-get install -y software-properties-common
apt-add-repository -y ppa:ansible/ansible
apt-get update -y
apt-get install -y ansible sshpass

export ANSIBLE_HOST_KEY_CHECKING=False

#install any ansible roles we may need
ansible-galaxy install --force ateoto.docker

ansible-playbook -u $SSH_USER -i $RANCHER_SERVER_HOST, --extra-vars "ansible_ssh_pass=$SSH_PASS" provisioning/rancher-server.yml
ansible-playbook -u $SSH_USER -i $RANCHER_AGENT_HOST, --extra-vars "ansible_ssh_pass=$SSH_PASS" provisioning/rancher-agent.yml