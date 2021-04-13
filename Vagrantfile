# install the required plugins to create aliases
required_plugins = ["vagrant-hostsupdater"]
required_plugins.each do |plugin|
    exec "vagrant plugin install #{plugin}" unless Vagrant.has_plugin? plugin
end

Vagrant.configure("2") do |config|

# if we want 2 virtual machines:
config.vm.define "app" do |app|
    # Linux ubuntu 16.04 box
    app.vm.box = "ubuntu/xenial64"
    # private network with ip
    app.vm.network "private_network", ip: "192.168.10.100"
    # alias to link this ip with logical web address
    app.hostsupdater.aliases = ["development.local"]
    # to transfer files/folder data from our OS to VM vagrant has an option of synced_folder
    app.vm.synced_folder ".", "/home/vagrant/app"
    # provision to install packages automatically
    app.vm.provision "shell", path: "environment/provision_app.sh"
end

# set up a second virtual machine
config.vm.define "db" do |db|
    db.vm.box = "ubuntu/xenial64"
    db.vm.network "private_network", ip: "192.168.10.101"
    db.hostsupdater.aliases = ["development.local"]
    db.vm.provision "shell", path: "environment/provision_db.sh"
end

end
