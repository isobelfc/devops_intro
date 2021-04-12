Vagrant.configure("2") do |config|

config.vm.box = "ubuntu/xenial64"
# Linux ubuntu 16.04 box

# let's attach private network with IP
config.vm.network "private_network", ip: "192.168.10.100"
# let's create an alias to link this ip with logical web address
config.hostsupdater.aliases = ["development.local"]

end
