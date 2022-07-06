#!/usr/bin/env bash

set -eu

mkdir -p /tmp/packages
cd /tmp/packages

wget "https://github.com/muesli/duf/releases/download/v0.8.1/duf_0.8.1_linux_amd64.deb"
dpkg -i duf_0.8.1_linux_amd64.deb

wget "https://github.com/bootandy/dust/releases/download/v0.8.0/du-dust_0.8.0_amd64.deb"
dpkg -i du-dust_0.8.0_amd64.deb 

wget "https://github.com/sharkdp/bat/releases/download/v0.21.0/bat_0.21.0_amd64.deb"
dpkg -i bat_0.21.0_amd64.deb

wget "https://dl.k8s.io/release/v1.24.0/bin/linux/amd64/kubectl"
install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl 

wget "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip"
unzip awscli-exe-linux-x86_64.zip 
./aws/install

wget "https://github.com/derailed/k9s/releases/download/v0.25.21/k9s_Linux_x86_64.tar.gz"
tar xvzf k9s_Linux_x86_64.tar.gz 
install -o root -g root -m 0755 k9s /usr/local/bin/k9s 

rm -fr /tmp/packages
