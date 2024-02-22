#!/bin/bash

if [[ ! -s ~/.ssh/authorized_keys ]]; then
    if [[ ! -s /publicKey ]]; then
    # Export private key so alumno can connect externally via ssh
        ssh-keygen -b 2048 -t rsa -m PEM -f ~/.ssh/id_rsa -q -N "" 
        cat ~/.ssh/id_rsa | sudo tee /generatedKeys/privateKey
        cat ~/.ssh/id_rsa.pub | sudo tee /generatedKeys/publicKey
        cat ~/.ssh/id_rsa.pub | sudo tee /publicKey
        cat ~/.ssh/id_rsa.pub > ~/.ssh/authorized_keys
        rm -rf ~/.ssh/id_rsa
        rm -rf ~/.ssh/id_rsa.pub
    else
        cat /publicKey > ~/.ssh/authorized_keys
    fi
fi

# start ssh service
sudo /usr/sbin/sshd -D
