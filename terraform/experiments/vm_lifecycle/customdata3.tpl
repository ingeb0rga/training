#!/bin/bash
sudo su
apt-get -y update
apt-get -y install apache2
systemctl start apache2
mv /var/www/html/index.html /var/www/html/index.html.bak

cat <<EOF > /var/www/html/index.html
<html>
<h2>Hello from ${f_name} ${l_name}</h2><br>
</html>
EOF

systemctl restart apache2
exit
