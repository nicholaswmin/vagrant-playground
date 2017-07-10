#!/usr/bin/env bash

# OS utils
sudo apt-get install curl

# Node.js & npm
curl -sL https://deb.nodesource.com/setup_6.x | sudo bash -
sudo apt-get install -y nodejs

# SQL Server 2017
curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
curl https://packages.microsoft.com/config/ubuntu/16.04/mssql-server.list | sudo tee /etc/apt/sources.list.d/mssql-server.list
sudo apt-get update
sudo apt-get install -y mssql-server

sudo SA_PASSWORD='vagrantT321' bash -c '/opt/mssql/bin/mssql-conf setup accept-eula'
