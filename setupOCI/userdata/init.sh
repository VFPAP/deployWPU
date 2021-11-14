#!/bin/bash

# Install prerequisites
sudo apt-get update &&
    sudo apt-get install -qqy curl git apt-transport-https ca-certificates gnupg-agent software-properties-common

# Install Docker repository and keys
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" &&
    sudo apt-get update &&
    sudo apt-get install docker-ce docker-ce-cli containerd.io -qqy

# Install docker-compose v1.29.2 (latest v1.x)
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose &&

    sudo chmod +x /usr/local/bin/docker-compose &&
    sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

# Update script
echo -n "IyEvYmluL2Jhc2gKCmNoZWNrX2V4aXRfc3RhdHVzKCkgewoKICAgIGlmIFsgJD8gLWVxIDAgXQogICAgdGhlbgogICAgICAgIGVjaG8KICAgICAgICBlY2hvICJTdWNjZXNzIgogICAgICAgIGVjaG8KICAgIGVsc2UKICAgICAgICBlY2hvCiAgICAgICAgZWNobyAiW0VSUk9SXSBQcm9jZXNzIEZhaWxlZCEiCiAgICAgICAgZWNobwoKICAgICAgICByZWFkIC1wICJUaGUgbGFzdCBjb21tYW5kIGV4aXRlZCB3aXRoIGFuIGVycm9yLiBFeGl0IHNjcmlwdD8gKHllcy9ubykgIiBhbnN3ZXIKCiAgICAgICAgaWYgWyAiJGFuc3dlciIgPT0gInllcyIgXQogICAgICAgIHRoZW4KICAgICAgICAgICAgZXhpdCAxCiAgICAgICAgZmkKICAgIGZpCn0KCnVwZGF0ZSgpIHsKCiAgICBzdWRvIGFwdCB1cGRhdGUgLS1maXgtbWlzc2luZzsKICAgIGNoZWNrX2V4aXRfc3RhdHVzCgogICAgc3VkbyBhcHQgZnVsbC11cGdyYWRlIC15OwogICAgY2hlY2tfZXhpdF9zdGF0dXMKCiAgICBzdWRvIGFwdCBpbnN0YWxsIC1mIC15OwogICAgY2hlY2tfZXhpdF9zdGF0dXMKCiMgVXBkYXRlIENvbmF0aW5lcnMKCiAgICBjZCAvZGVwbG95V1BVL3NldHVwV2lyZUhvbGUKICAgIHN1ZG8gZG9ja2VyLWNvbXBvc2Ugc3RvcDsgY2hlY2tfZXhpdF9zdGF0dXMKCiAgICBzdWRvIGRvY2tlciBwdWxsIG12YW5jZS91bmJvdW5kOmxhdGVzdDsgY2hlY2tfZXhpdF9zdGF0dXMKICAgIHN1ZG8gZG9ja2VyIHB1bGwgbGludXhzZXJ2ZXIvd2lyZWd1YXJkOmxhdGVzdDsgY2hlY2tfZXhpdF9zdGF0dXMKICAgIHN1ZG8gZG9ja2VyIHB1bGwgcGlob2xlL3BpaG9sZTpsYXRlc3Q7IGNoZWNrX2V4aXRfc3RhdHVzCgogICAgIyBVcGFkYXRlIHJvb3QuaGludHMKICAgIHN1ZG8gd2dldCAtcU8gL2RlcGxveVdQVS9zZXR1cFdpcmVIb2xlL3VuYm91bmQvdmFyL3Jvb3QuaGludHMgaHR0cHM6Ly93d3cuaW50ZXJuaWMubmV0L2RvbWFpbi9uYW1lZC5yb290CgogICAgc3VkbyBkb2NrZXItY29tcG9zZSB1cCAtZAogICAgY2hlY2tfZXhpdF9zdGF0dXMKICAgIGNkIC0KfQoKY2xlYW4oKSB7CgogICAgc3VkbyBhcHQgYXV0b3JlbW92ZSAteTsKICAgIGNoZWNrX2V4aXRfc3RhdHVzCgogICAgc3VkbyBhcHQgYXV0b2NsZWFuIC15OwogICAgY2hlY2tfZXhpdF9zdGF0dXMKCiAgICBzdWRvIHVwZGF0ZWRiOwogICAgY2hlY2tfZXhpdF9zdGF0dXMKfQoKCnVwZGF0ZTsKY2xlYW47CmV4aXQ7Cg=="|base64 -d|sudo tee /home/ubuntu/update
chown ubuntu:ubuntu /home/ubuntu/update && chmod +x /home/ubuntu/update 

# Deploy container
git clone https://github.com/VFPAP/deployWPU.git && cd deployWPU/setupWireHole && docker-compose up &
