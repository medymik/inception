sed -i "s/__sql__user__/$MYSQL_USER/g" /wordpress/wp-config.php
sed -i "s/__sql__pass__/$MYSQL_PASSWORD/g" /wordpress/wp-config.php

if [ ! -f "/www/wordpress/wp-config.php" ];
then
    cp -Rf /wordpress/* /www/wordpress
fi

php-fpm7 -F -R