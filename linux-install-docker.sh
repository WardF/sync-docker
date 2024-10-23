#!/bin/bash
# 
# Taken from https://docs.docker.com/engine/install/debian/ and https://docs.docker.com/engine/install/linux-postinstall/

set -e

# Add Docker's official GPG key:
echo -e "o Adding Docker's official GPG key"
sudo apt update
sudo apt install -y ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
set -x
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
set +x

echo -e "o Adding repository to Apt Sources"
set -x
# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
set +x

echo -e "o Installing Docker engine."
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

set +e
echo -e "o Creating docker group"
sudo groupadd docker

echo -e "o Adding user to group"
set -e
sudo usermod -aG docker $USER

echo -e "o Finished"

