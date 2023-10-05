#!/usr/bin/env bash
# Sets up a web server for deployment of web_static.

apt-get update
apt-get install -y nginx

mkdir -p /data/web_static/releases/test/
mkdir -p /data/web_static/shared/
echo "Holberton School" > /data/web_static/releases/test/index.html
ln -sf /data/web_static/releases/test/ /data/web_static/current

<<<<<<< HEAD
chown -R ubuntu /data/
chgrp -R ubuntu /data/
=======
chown -R ubuntu:ubuntu /data/  # Set both owner and group to ubuntu
>>>>>>> df7b5d4f9bcb36151671070a44919298ccea2033

printf %s "server {
    listen 80 default_server;
    listen [::]:80 default_server;
<<<<<<< HEAD
    add_header X-Served-By $HOSTNAME;
=======
    add_header X-Served-By \$HOSTNAME;
>>>>>>> df7b5d4f9bcb36151671070a44919298ccea2033
    root   /var/www/html;
    index  index.html index.htm;

    location /hbnb_static {
        alias /data/web_static/current;
        index index.html index.htm;
    }

    location /redirect_me {
        return 301 http://cuberule.com/;
    }

    error_page 404 /404.html;
    location /404 {
      root /var/www/html;
      internal;
    }
}" > /etc/nginx/sites-available/default

service nginx restart
