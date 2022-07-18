# apk package management. Install from apk
# Docker desktop    ok
# Azure CLI         ok 
# Kubectl CLI       ok
# Helm CLI          ok
# Terraform CLI     ok
sudo apt-get update -y

# terraform
echo "Installing Terraform"
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update -y
sudo apt install terraform

echo "Installing Azure CLI"
# azure cli
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# docker
echo "Installing Docker"
sudo apt update -y
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
sudo apt update -y
sudo apt install -y docker-ce

echo "Install Kubectl"
sudo apt-get update -y
sudo apt-get install -y apt-transport-https ca-certificates curl
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update -y
sudo apt-get install -y kubectl

echo "Install Helm"
sudo apt-get update -y
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
chmod +x get_helm.sh
./get_helm.sh

echo "Activate Docker"
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker