# Create a password for securing locations
# apt-get install -y apache2-utils 	
htpasswd -b -c /etc/nginx/passwords admin admin
chown www-data /etc/nginx/passwords
chmod 600 /etc/nginx/passwords

location /appointments/ {
# only allow IPs from the same network the server is on
	allow 192.168.0.0/24;
	allow 10.0.0.0/8;
	deny all;

	auth_basic "Authentication is required...";
	auth_basic_user_file /etc/nginx/passwords;

	location ~ \.php$ {
	include snippets/fastcgi-php.conf;
	fastcgi_pass unix:/var/run/php/php7.2-fpm.sock;
	fastcgi_intercept_errors on;
	}
}
