# Create an SSL key and certificate
# apt -y install openssl11
openssl req -batch -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt 2>/dev/null

server {
	listen 443 ssl default_server;
	ssl_certificate /etc/ssl/certs/nginx.crt;
	ssl_certificate_key /etc/ssl/private/nginx.key;

	root /var/www/wisdompetmed.local;

	server_name wisdompetmed.local www.wisdompetmed.local;

	index index.html index.htm index.php;

	access_log /var/log/nginx/wisdompetmed.local.access.log;
	error_log /var/log/nginx/wisdompetmed.local.error.log;

	location / {
	# First attempt to serve request as file, then
	# as directory, then fall back to displaying a 404.
	try_files $uri $uri/ =404;
	}
}

