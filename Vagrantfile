# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  
  config.vm.box = 'geerlingguy/centos7'
  config.vm.synced_folder "./", "/vagrant", owner: "vagrant", mount_options: ["dmode=775,fmode=600"]
  config.vm.provider :virtualbox do |v|
    v.memory = "2048"
    v.cpus = "2"
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["modifyvm", :id, "--ioapic", "on"]
  end
  config.vm.define "alfresco" do |machine|
    machine.vm.network "private_network", ip: "10.0.0.10"
	machine.vm.network :forwarded_port, guest: 8080, host: 8080
    machine.vm.hostname = "alfresco"
  end
  
  # WVCT2 VM controller.
  config.vm.define "controller" do |machine|
    machine.vm.hostname = "controller"
    machine.vm.network :private_network, ip: "10.0.0.11"
    machine.vm.provision "ansible_local" do |ansible|
      ansible.galaxy_role_file = "requirements.yml"
      ansible.playbook = "playbook.yml"
      ansible.verbose = true
      ansible.install = true
      ansible.limit = "all"
      ansible.provisioning_path = "/vagrant/tests"
      ansible.inventory_path = "hosts"
    end
  end
  
end
