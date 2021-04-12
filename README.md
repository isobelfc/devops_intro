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
