# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

$number_of_nodes = 1
# DO NOT USE 172.17.*, 172.18.*, 10.0.2 as these are used on other NICs: routing will get screwed!
$private_ip_prefix = '172.19.8' # rancher-server will be on 172.19.8.100, other nodes will start from 172.19.8.101

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box         = 'debian/jessie64'

  config.vm.provider 'virtualbox' do |vb|
    vb.gui = false
    vb.memory = 1024
    vb.cpus = 1
  end

  hostname_server = 'rancher-server'
  server_ip = "172.19.8.100"
  config.vm.define hostname_server do |server|
    server.vm.hostname = 'rancher-server'
    server.vm.network 'forwarded_port', guest: 8080, host: 8080, auto_correct: true
    server.vm.network 'private_network', ip: server_ip
    server.vm.synced_folder ".", "/vagrant", disabled: true
  end

  hostname_node = 'rancher-agent-1'
  node_ip = "172.19.8.101"
  config.vm.define hostname_node do |node|
    node.vm.hostname = hostname_node
    node.vm.network 'private_network', ip: node_ip
    node.vm.synced_folder ".", "/vagrant", disabled: true
  end


end
