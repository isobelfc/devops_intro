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
