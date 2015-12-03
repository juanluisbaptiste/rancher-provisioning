cp /vagrant/provisioning/inventory/vagrant_inventory /var/tmp
chmod -x /var/tmp/vagrant_inventory

RANCHER_SERVER_HOST=172.19.8.100
RANCHER_AGENT_HOST=172.19.8.101
SSH_PASS=vagrant
SSH_USER=vagrant

# Main provisioning entry point
cd /vagrant/ && ./provision.sh