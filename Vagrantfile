# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  hostname_server = 'rancher-server'
  server_ip = "172.19.8.100"
  config.vm.define hostname_server do |node|
    node.vm.box  = 'debian/jessie64'
    node.vm.hostname = 'rancher-server'
    node.vm.network 'forwarded_port', guest: 8080, host: 8080, auto_correct: true
    node.vm.network 'private_network', ip: server_ip
    node.vm.synced_folder ".", "/vagrant", disabled: true
  end

  hostname_node = 'rancher-agent-1'
  node_ip = "172.19.8.101"
  config.vm.define hostname_node do |node|
    node.vm.box  = 'debian/jessie64'
    node.vm.hostname = hostname_node
    node.vm.network 'private_network', ip: node_ip
    node.vm.synced_folder ".", "/vagrant", disabled: true
  end

#  hostname_node = 'rancher-agent-2'
#  node_ip = "172.19.8.102"
#  config.vm.define hostname_node do |node|
#    node.vm.box  = 'debian/jessie64'
#    node.vm.hostname = hostname_node
#    node.vm.network 'private_network', ip: node_ip
#    node.vm.synced_folder ".", "/vagrant", disabled: true
#  end

  hostname_server = 'rancher-provisioner'
  config.vm.define hostname_server do |node|
    node.vm.box  = 'ubuntu/trusty64'
    node.vm.hostname = 'rancher-provisioner'
    node.vm.provision "shell", path: "bootstrapProvisioner.sh", privileged: true
  end
end
