# -*- mode: ruby -*-
Vagrant.configure("2") do |config|
  config.vm.box = "gbailey/amzn2"

  config.vm.network "forwarded_port", guest: 3080, host: 3080

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "playbook.yml"
    ansible.extra_vars = {}
  end
end
