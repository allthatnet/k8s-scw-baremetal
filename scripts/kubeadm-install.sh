#!/usr/bin/env bash

set -e

curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" | tee /etc/apt/sources.list.d/kubernetes.list
apt-get update -qq
K8S_PKG_VER="1.9*"
apt-get install -qy kubeadm=$K8S_PKG_VER kubectl=$K8S_PKG_VER kubelet=$K8S_PKG_VER

