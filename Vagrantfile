# -*- mode: ruby -*-
# vi: set ft=ruby :

#Vagrant.configure("1") do |config|
# Enabling a bridged Network
#  config.vm.network :bridged
# end


Vagrant.configure('2') do |config|
  config.vm.box = 'puppetlabs-centos-64-x64'
# Enabling a bridged Network with this version.
# It is likely that public networks will be replaced by :bridged in a future release,
# since that is in general what should be done with public networks, and providers that
# don't support bridging generally don't have any other features that map to public networks either.
#  config.vm.network "public_network"

# Cisco AnyConnect Secure Mobility Client Virtual Miniport Adapter for Windows x64


  # Puppet Labs CentOS 6.4 for VirtualBox
  config.vm.provider :virtualbox do |virtualbox, override|
    override.vm.box_url = 'http://puppet-vagrant-boxes.puppetlabs.com/centos-64-x64-vbox4210.box'
    virtualbox.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
  end


  HOST_IP = "192.168.111.242"

  # qa server
  config.vm.define :dev do |config|
    config.vm.hostname = "dev.local"
    config.vm.network "forwarded_port", guest: 8081, host: 9081
    config.vm.network "forwarded_port", guest: 8181, host: 9181
    config.vm.network "private_network", ip: HOST_IP
  end

  config.vm.synced_folder "hieradata","/tmp/vagrant-puppet/hieradata"
  
  config.vm.provision :shell, :path => "bootstrap.sh"

  # Puppet provisioner for primary configuration
  config.vm.provision :puppet do |puppet|
    # provision development environment
    # add additional .yaml files for new environments
    puppet.facter = {
      "role" => "jenkins_artifactory",
    }

    puppet.module_path = "modules"
    puppet.manifests_path = "manifests"
    puppet.manifest_file = "init.pp"
    
    puppet.hiera_config_path = "hiera.yaml"
    puppet.working_directory = "/tmp/vagrant-puppet"
    
    puppet.options = "--verbose --debug --hiera_config hiera.yaml"

  end

end
