sed -i "s/__sql__user__/$MYSQL_USER/g" /wordpress/wp-config.php
sed -i "s/__sql__pass__/$MYSQL_PASSWORD/g" /wordpress/wp-config.php

if [ ! -f "/www/wordpress/wp-config.php" ];
then
    cp -Rf /wordpress/* /www/wordpress
    cp /www/wordpress/wp-content/plugins/redis-cache/includes/object-cache.php /www/wordpress/wp-content/object-cache.php
fi

php-fpm7 -F -R
