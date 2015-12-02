apt-get update -y
apt-get install -y software-properties-common
apt-add-repository -y ppa:ansible/ansible
apt-get update -y
apt-get install -y ansible sshpass

cp /vagrant/provisioning/inventory/vagrant_inventory /var/tmp
chmod -x /var/tmp/vagrant_inventory
export ANSIBLE_HOST_KEY_CHECKING=False

#install any ansible roles we may need
ansible-galaxy install --force ateoto.docker

# Now run the rancher provisioning
ansible-playbook -i /var/tmp/vagrant_inventory /vagrant/provisioning/rancher-server.yml
ansible-playbook -v -i /var/tmp/vagrant_inventory /vagrant/provisioning/rancher-agent.yml
