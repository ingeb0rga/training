FROM amazonlinux

RUN yum -y update && yum install -y httpd php
COPY ./index.php /var/www/html/index.php

CMD ["/usr/sbin/httpd","-D","FOREGROUND"]

EXPOSE 80