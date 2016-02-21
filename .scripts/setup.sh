#!/bin/bash

# Copy i3status.conf
sudo mv .scripts/resources/i3status.conf /etc/i3status.conf

# Set up group for docker
sudo groupadd docker
sudo gpasswd -a ${USERNAME} docker
sudo service docker restart

