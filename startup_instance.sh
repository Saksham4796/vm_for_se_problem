#!/bin/bash

sudo apt-get update
sudo apt-get install -y python3 python3-pip git
pip install redis
pip install mysql-connector-python

# Install Docker 
sudo apt-get update
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
    
sudo mkdir -m 0755 -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  
sudo apt-get update

sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

sudo docker run hello-world

# Resolve the Error

sudo apt remove containerd
sudo apt update
sudo apt install containerd.io

sudo rm /etc/containerd/config.toml
sudo systemctl restart containerd

# Install Kubernetes

sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl

sudo curl -fsSLo /etc/apt/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg

echo "deb [signed-by=/etc/apt/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list

sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl


# Install JAVA

sudo DEBIAN_FRONTEND=noninteractive apt-get update && sudo apt-get -y install default-jre-headless && sudo apt-get clean && sudo rm -rf /var/lib/apt/lists/*

# Set JAVA Environment

export JAVA_HOME="$(dirname $(dirname $(readlink -f $(which java))))"

sudo apt-get update
sudo apt-get install -y wget

# Download Spark and set Environment variables
sudo mkdir -p /opt/spark \
	&& cd /opt/spark \
	&& sudo wget https://dlcdn.apache.org/spark/spark-3.3.2/spark-3.3.2-bin-hadoop3.tgz \
	&& sudo tar xvf spark-3.3.2-bin-hadoop3.tgz

export SPARK_HOME=/opt/spark/spark-3.3.2-bin-hadoop3
export PATH=$PATH:$SPARK_HOME/bin
