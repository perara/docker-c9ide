#!/bin/bash

# Doing this in a separate script lets us do it step by step while using a
# single docker layer.

# Install dependencies
dnf install -y \
    curl \
    python2-dnf \
    ansible \
    tar \
    which \
    sudo \
    nss_wrapper \
    gettext \
    zip

# Create user
adduser user -u 1000 -g 0 -r -m -d /home/user/ -c "Default Application User" -l
echo "user ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/user
chmod 0440 /etc/sudoers.d/user

# Ansible deployment
curl -sSL https://raw.githubusercontent.com/perara/docker-c9ide/master/ansible/install-c9sdk.yml -o /tmp/install.yml
su - user -c "ansible-playbook /tmp/install.yml"

## Create work directory
mkdir -p /workspace
chown user:root /workspace

# allow to run on openshift
chown -R user:root /opt/c9sdk
chmod -R g+rw /opt/c9sdk
chmod -R g+rw /home/user
find /home/user -type d -exec chmod g+x {} +

# Clean up
dnf clean all
rm /tmp/install.yml
