Vagrant.require_version ">=2.2.4"

# Install plugins
required_plugins = %w(vagrant-disksize vagrant-proxyconf)
required_plugins.each do |plugin|
    raise "\"#{plugin}\" plugin is not installed! Use sudo vagrant plugin install <plugin>" unless Vagrant.has_plugin? plugin
end

Vagrant.configure("2") do |config|
  config.vm.box = "generic/ubuntu1804"
  config.vm.synced_folder "./vagrant_shared", "/home/vagrant/vagrant_shared"

  config.vm.provider "virtualbox" do |vb|
    vb.name = "test_vm"
    vb.memory = "16384"
    vb.cpus = 8
    vb.gui = false
    vb.customize ["modifyvm", :id, "--vram", 128]
    vb.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
    vb.customize ["modifyvm", :id, "--hwvirtex", "off"]
    vb.customize ["modifyvm", :id, "--accelerate3d", "off"]
    vb.customize ["setextradata", "global", "GUI/SuppressMessages", "all" ]
 end
  
    # Draper proxy settings
    config.proxy.http = "http://140.102.12.12:3128"
    config.proxy.https = "http://140.102.12.12:3128"
    config.proxy.no_proxy = "127.0.0.1,localhost"
    # Add git proxy configuration
    config.vm.provision "shell", inline: "git config --global http.proxy 140.102.12.12:3128" 
    config.vm.provision "shell", inline: "git config --global https.proxy 140.102.12.12:3128" 
    config.vm.provision "shell", inline: "git config --global http.sslverify false"
    # Install system environment requirements
    config.vm.provision "shell", path: "install.sh", privileged: false
    config.vm.provision "shell", inline: "stack upgrade --binary-only --allow-different-user --local-bin-path /usr/local/bin"
    
    # Clone and build hope-src toolchain
    config.vm.provision "shell", inline: "git clone https://github.com/draperlaboratory/hope-src.git", privileged: false
    config.vm.provision "shell", inline: "echo 'cloned repo'"
    config.vm.provision "shell", inline: "mkdir -p ~/.local/isp", privileged: false
    config.vm.provision "shell", inline: "cd hope-src && ./init-submodules.sh", privileged: false
    config.vm.provision "shell", inline: "cd hope-src && source ./tools/isp-support/set-env && make", privileged: false
end
