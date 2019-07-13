#!/usr/bin/env bash


# Step 1. Install and configure the necessary dependencies

## On CentOS 7 the commands below will also open HTTP and SSH access in the system firewall
sudo yum install -y curl policycoreutils-python openssh-server
sudo systemctl enable sshd
sudo systemctl start sshd

## Next, install Postfix to send notification emails
sudo firewall-cmd --permanent --add-service=http
sudo systemctl reload firewalld

# Step 2. Add the GitLab package repository and install the package

## Add the GitLab package repository
curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.rpm.sh | sudo bash

## Install Gitlab
sudo yum install -y gitlab-ee