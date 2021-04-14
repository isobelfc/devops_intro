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

# set database as variable
sudo echo "export DB_HOST=mongodb://192.168.10.101:27017/posts" >> ~/.bashrc

# populate posts database
node app/app/seeds/seed.js
