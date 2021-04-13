# DevOps

## Before DevOps
- Development would develop, then pass to operations
- When operations encountered errors, they would have to pass back to Development
- Little communication between the teams

## Infrastructure Revolution
- Growth of cloud computing
- Allows scaling on demand

### Application Design Patterns
- Monolith vs N-tier vs Microservice
- Monolith: everything in the same place, with no backup. Use for very small projects.
- N-tier: seperate front and back end
- Microservices: lots of different teams

- Waterfall: each stage of development takes place in sequence. Hard to track back when finding errors at late stages, dependencies right the way to the end
- Agile: iterations, meaning no dependencies

## DevOps Basics
- Reduces time to market by an estimated 50%
- Collaboration of Development and Operations
- A culture which promotes collaboration between Dev and Ops team to deploy code to production faster in an automated and repeatable way. Culture - the company as a whole needs to understand importance
- Practice of development and operation engineers taking part together in the whole service lifecycle
- Approach through which superior quality software can be developed quickly and with more reliability
- Alignment of development and IT operations with better communication and collaboration
- Shortens times but keeps high quality

### Principles
- Customer-centric action
- End-to-end responsibility
- Continuous improvement
- Automate everything
- Work as one team
- Monitor and test everything

### Stages in Lifecycle
- Continuous development
- Continuous testing
- Continuous integration
- Continuous deployment
- Continuous monitoring

### Tools
- Ansible
- Chef
- Git
- Jenkins
- Bamboo
- AWS
- Many others

### Implementations
- Infrastructure as Code
- Infrastructure as a Service
- Infrastructure as a Platform
- Infrastructure as a Product

### Risk register
- Chance of occurrence of events, the potential damage and the risk

### Tasks of DevOps engineer
- Soft skills
- Sysadmin
- Deploy virtualisation
- Hands-on experience in network and storage
- Knowledge of coding
- Understanding the automation tools
- Knowledge of testing

## Vagrant Commands
- `vagrant up` to spin up a virtual machine
- `vagrant destroy` to destroy
- `vagrant reload` to reload
- `vagrant status` to check how many machines are running and if they are all running
- `vagrant ssh` to ssh into virtual machine (VM)
- `vagrant halt` to pause

- apt-get in Linux is a package manager to install/update like windows installer
- `apt-get`

### Vagrantfile
- We need a file called Vagrantfile, which contains the necessary info to run the VM

```
Vagrant.configure("2") do |config|

config.vm.box = "ubuntu/xenial64"

end
```

### Linux Commands
- name of machine `uname`
- list directories `ls`
- list all directories `ls -a`
- make directory `mkdir`
- create file `nano file_name`
- rename file `mv file_name new_file_name`
- `sudo` used to run commands as an admin
- `sudo su` to go into admin mode
- to go back a directory from current location `cd ..`
- current location `pwd`
- to update `sudo apt-get update -y`
- to upgrade `sudo apt-get upgrade -y`
- `clear` to clear screen/terminal
- copy README file from current location to devops folder `cp README.md devops/README.md`
- delete file `rm file_name`
- move file `mv README.md devops/`
- chmod permission 700 400 u x w r
- check current permission `ll`
- give executable permission `chmod +x file_name`
- `top` to check current processes
- `ps` check process `ps aux`
- Let's install web server called NGINX `sudo apt-get install nginx`
- check if the nginx has been installed `systemctl status nginx`

### Tests
- we were given a folder containing some tests
- these check whether certain things are installed within the VM
- most will fail when first run
- move into the spec-tests folder on the host machine
- install bundle with `bundle` (will need to run `gem install bundler:2.2.9` first the first time)
- run the tests with `rake spec`
- install each package from inside the VM
- rerun tests on the host machine
- install a specific version of nodejs with `curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -` and then `sudo apt-get install nodejs -y`
- install pm2 by npm with `sudo npm install pm2 -g`

### Automatically installing packages
- list installation commands in a `provision.sh` file in the environment folder
- add shell script path to our Vagrantfile
- `config.vm.provision "shell", path: "environment/provision.sh"`

## Multi Machine Vagrant Task
- to set up a second virtual machine from the same Vagrantfile we need each one in a separate `config.vm.define` block

```
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
```

- `vagrant up` now targets every machine by default
- to ssh into a machine you need to specify the name of the machine, e.g. `vagrant ssh app`
- provision the `app` machine

```
provision.sh
#!/bin/bash

# run the update command
sudo apt-get update -y

# upgrade command
sudo apt-get upgrade -y

# install nginx
sudo apt-get install nginx -y

# install nodejs with required version and dependencies
sudo apt-get install python-software-properties

curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install nodejs -y

# install pm2 with npm
sudo npm install pm2 -g
```

- provision the db machine

```
provision.sh
#!/bin/bash

# upgrade command
sudo apt-get upgrade -y

# install mongodb key
wget -qO - https://www.mongodb.org/static/pgp/server-3.2.asc | sudo apt-key add -

# create mongodb list file
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list

# run the update command
sudo apt-get update -y

# install mongodb packages of version 3.2.20
sudo apt-get install -y mongodb-org=3.2.20 mongodb-org-server=3.2.20 mongodb-org-shell=3.2.20 mongodb-org-mongos=3.2.20 mongodb-org-tools=3.2.20
```
