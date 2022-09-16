#!/bin/bash
sudo su
apt-get -y update
apt-get -y install apache2
systemctl start apache2
mv /var/www/html/index.html /var/www/html/index.html.bak

# cat <<EOF > /var/www/html/index.html
# <html>
# <h2>Hello from spirt</h2><br>
# </html>
# EOF

echo "<html>" > /var/www/html/index.html
echo :<h2>Hello from ${f_name} ${l_name}</h2><br>"" >> /var/www/html/index.html
echo "%{ for i in names ~ }" >> /var/www/html/index.html
echo "Greetings to ${i}<br>" >> /var/www/html/index.html
echo "%{ endfor ~ }" >> /var/www/html/index.html
echo "</html>" >> /var/www/html/index.html

systemctl restart apache2
exit

