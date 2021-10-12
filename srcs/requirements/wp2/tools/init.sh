sed -i "s/__sql__user__/$MYSQL_USER/g" /wordpress/wp-config.php
sed -i "s/__wp__pass__/$MYSQL_PASSWORD/g" /wordpress/wp-config.php

mkdir /www
mv wordpress /www
php-fpm7 -F -R