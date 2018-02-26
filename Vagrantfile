# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "geerlingguy/ubuntu1604"
  config.vm.network :private_network, ip: "192.168.66.66"
  config.vm.hostname = "fail2ban.test"
  config.ssh.insert_key = false

  config.vm.provider :virtualbox do |v|
    v.memory = 1024
  end

  # Ansible provisioner.
  config.vm.provision :ansible do |ansible|
    ansible.playbook = "provisioning/playbook.yml"
    ansible.become = true
  end
end
