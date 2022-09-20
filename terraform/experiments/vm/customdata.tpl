#!/bin/bash
sudo apt-get -y update
sudo apt-get -y install apache2
sudo systemctl start apache2
sudo mv /var/www/html/index.html /var/www/html/index.html.bak
