#!/bin/bash

# Update the system 
sudo yum update -y

# Install necessary dependencies (Java, wget,...)
sudo yum install -y java-1.8.0-openjdk wget

# Set variables for WebSphere Installation
WEBSPHERE_VERSION= "9.0.5"
WEBSPHERE_INSTALLER="WebSphereApplicationServer${WEBSPHERE_VERSION}-linux-x86_64.tar.gz"
WEBSPHERE_INSTALL_PATH= "/opt/IBM/WebSphere/AppServer"

#Download the WebSphere installer
wget "https://webspherepathto/${WEBSPHERE_INSTALLER}" -P /tmp

# Extract the installer
cd /tmp
tar -xzvf "${WEBSPHERE_INSTALLLER}"

# Install WebSphere silently (assuming you have a silent installation response file)
cd WebSphereApplicationServer
./install -silent

#set environment variables for WebSphere
echo "export WAS_HOME=${WEBSPHERE_INSTALL_PATH}" >> ~/.bash_profile
echo "export PATH=\$WAS_HOME/bin:\$PATH" >> ~/.bash_profile
source ~/.bash_profile

# Start WebSphere server (assume that server configuration is already available)
${WAS_HOME}/bin/startServer.sh server1

echo "WebSphere Installation Completed!"
