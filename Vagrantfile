# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "hashicorp/precise32"

  config.vm.hostname = 'vtapi'
  config.hostsupdater.aliases = ["vtapi.dev"]
  config.vm.network :private_network, ip: "192.168.33.10"

  config.vm.synced_folder "vagrant/", "/srv/vtapi", :mount_options => ["dmode=777","fmode=666"]
    
  config.vm.provision "ansible" do |ansible|
    #ansible.verbose = 'vvvv'
    ansible.limit = 'all'
    ansible.inventory_path = 'inventory'
    ansible.playbook = "provisions/playbook.yml"
  end
end
