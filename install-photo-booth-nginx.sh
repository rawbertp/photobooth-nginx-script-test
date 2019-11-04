#!/bin/bash -xe

cat <<EOF > /var/www/html/index.php
<?php
	phpinfo();
?>
EOF

mkdir /run/php

sed -i 's/^\(\s*\)index index\.html\(.*\)/\1index index\.php index\.html\2/g' /etc/nginx/sites-available/default
sed -i '/location ~ \\.php$ {/s/^\(\s*\)#/\1/g' /etc/nginx/sites-available/default
sed -i '/include snippets\/fastcgi-php.conf/s/^\(\s*\)#/\1/g' /etc/nginx/sites-available/default
sed -i '/fastcgi_pass unix:\/run\/php\//s/^\(\s*\)#/\1/g' /etc/nginx/sites-available/default
sed -i '/.*fastcgi_pass unix:\/run\/php\//,// { /}/s/^\(\s*\)#/\1/g; }' /etc/nginx/sites-available/default

/usr/sbin/nginx -t -c /etc/nginx/nginx.conf

/usr/sbin/php-fpm7.3 -D
exec /usr/sbin/nginx -g "daemon off;"
