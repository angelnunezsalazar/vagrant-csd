# -*- mode: ruby -*-
# vi: set ft=ruby :
# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "raring-cloud"
  config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/raring/current/raring-server-cloudimg-i386-vagrant-disk1.box"
  config.vm.network "forwarded_port", guest: 80, host: 8585 #Subversion
	config.vm.network "forwarded_port", guest: 8080, host: 8686 #Jenkins
  
  config.vm.provider :virtualbox do |vb|
    # Don't boot with headless mode
    #vb.gui = true
      
    vb.customize ["modifyvm", :id, "--memory", "1024"]
    vb.customize ["modifyvm", :id, "--graphicscontroller", "vboxvga"]
    vb.customize ["modifyvm", :id, "--ioapic", "on"]
    vb.customize ["modifyvm", :id, "--vram", "128"]
    vb.customize ["modifyvm", :id, "--hwvirtex", "on"]
	vb.name = "CSD"
  end
  
  config.vm.provision :puppet do |puppet|
	  puppet.manifests_path = "manifests"
    puppet.manifest_file = "init.pp"
		puppet.module_path = [ 'modules/src', 'modules/vendor' ]
  end
end
