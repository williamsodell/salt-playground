# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|

  # Proxy Settings
  def configure_proxy(vm_def)
    if Vagrant.has_plugin?("vagrant-proxyconf")

      vm_def.proxy.http = ENV['http_proxy']
      vm_def.proxy.https = ENV['https_proxy']
      vm_def.apt_proxy.http = ENV['http_proxy']
      vm_def.apt_proxy.https = ENV['https_proxy']
      vm_def.proxy.no_proxy = ENV['no_proxy']
    end
  end

  vm_box = 'ubuntu/precise64'
  #hashicorp/precise64

  # The Salt Master VM
  config.vm.define :saltmaster do |saltmaster|
    configure_proxy(saltmaster)
    saltmaster.vm.box = vm_box
    saltmaster.vm.box_check_update = true
    saltmaster.vm.network :private_network, ip: '192.168.37.10'
    saltmaster.vm.hostname = 'saltmaster'

    saltmaster.vm.synced_folder "salt/roots/", "/srv/salt/"
    saltmaster.vm.provision :shell, path: "master_bootstrap.sh"
  end

  # The Minion01 VM
  config.vm.define :minion01 do |minion01|
    configure_proxy(minion01)
    minion01.vm.box = vm_box
    minion01.vm.box_check_update = true
    minion01.vm.network :private_network, ip: '192.168.37.11'
    minion01.vm.hostname = 'minion01'

    #minion01.vm.synced_folder "salt/roots/", "/srv/salt/"
    minion01.vm.provision :shell, path: "minion_bootstrap.sh"
  end

  # The Minion02 VM
  config.vm.define :minion02 do |minion02|
    configure_proxy(minion02)
    minion02.vm.box = "ubuntu/trusty64"
    minion02.vm.box_check_update = true
    minion02.vm.network :private_network, ip: '192.168.37.12'
    minion02.vm.hostname = 'minion02'

    #minion01.vm.synced_folder "salt/roots/", "/srv/salt/"
    minion02.vm.provision :shell, path: "minion_bootstrap.sh"
  end
end
