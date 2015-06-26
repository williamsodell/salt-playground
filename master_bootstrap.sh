#!/usr/bin/env bash

curl -L https://bootstrap.saltstack.com -o install_salt.sh
sudo sh install_salt.sh -M

# Start Setting up GitFS
#   for formulas from git repos
# If on 12.04 instead of 14.04
apt-get install git python-pip -y
pip install GitPython
# Else
# apt-get install python-git
# Endif

echo '# Setup for GitFS
fileserver_backend:
  - git
  - roots

gitfs_remotes:
  - https://github.com/saltstack-formulas/apache-formula.git
  - https://github.com/saltstack-formulas/php-formula.git
  - https://github.com/saltstack-formulas/composer-formula.git
  - https://github.com/saltstack-formulas/node-formula.git
  - https://github.com/saltstack-formulas/os-hardening-formula.git
  - https://github.com/saltstack-formulas/apt-formula.git
  - https://github.com/saltstack-formulas/mailcatcher-formula.git
  - https://github.com/saltstack-formulas/sudoers-formula.git
  - https://github.com/saltstack-formulas/reverse-users-formula.git
' > /etc/salt/master.d/gitfs.conf

sed -i '/^#default_include: master.d\/\*\.conf/s/^#//' master
# End Setting up GitFS
