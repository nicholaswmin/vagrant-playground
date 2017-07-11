#!/usr/bin/env bash

# Install OS utils
sudo apt-get install curl

# Install Node.js & npm
curl -sL https://deb.nodesource.com/setup_6.x | sudo bash -
sudo apt-get install -y nodejs

# Install SQL Server Tools
curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
curl https://packages.microsoft.com/config/ubuntu/16.04/prod.list | sudo tee /etc/apt/sources.list.d/msprod.list
sudo apt-get update
sudo ACCEPT_EULA='Y' bash -c 'apt-get install -y mssql-tools unixodbc-dev'

# Create guest SQL server

# Install SQL Server 2017
curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
curl https://packages.microsoft.com/config/ubuntu/16.04/mssql-server.list | sudo tee /etc/apt/sources.list.d/mssql-server.list
sudo apt-get update
sudo apt-get install -y mssql-server

# Configure the user for SQL Server
sudo SA_PASSWORD='vagrantT321' bash -c '/opt/mssql/bin/mssql-conf setup accept-eula'

# Create an SQL Server database on guest SQL Server
sudo /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P 'vagrantT321' -Q 'CREATE DATABASE vagrant_dev_internal;'

# Create host SQL Server
# Assumes you already have a running SQL server instance on host

# Create an SQL Server database on guest SQL Server
# sudo /opt/mssql-tools/bin/sqlcmd -S 10.0.2.2 -U localhost -P 'localhost' -Q 'CREATE DATABASE vagrant_dev_internal;'
