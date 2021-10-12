if [ ! -f "/var/lib/mysql/ib_buffer_pool" ];
then
    /etc/init.d/mariadb setup &> /dev/null
    service mariadb start &> null
    # mysql --user=root < req.sql
    #mysql --user=root wordpress < wordpress.sql

    mysql -u root < db.sql
    #echo "CREATE DATABASE wordpress;" | mysql -u root
    echo "CREATE USER '${MYSQL_USER}'@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}'" | mysql -u root
    echo "GRANT ALL PRIVILEGES ON wordpress.* TO '${MYSQL_USER}'@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}'" | mysql -u root
    echo "FLUSH PRIVILEGES;" | mysql -u root
    echo "CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}'" | mysql -u root
    echo "GRANT ALL PRIVILEGES ON wordpress.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}'" | mysql -u root
    echo "FLUSH PRIVILEGES;" | mysql -u root
    echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';" | mysql -u root
    echo "FLUSH PRIVILEGES;" | mysql -u root
    service mariadb stop
fi
chown -R root:root /var/lib/mysql
sed -i 's/skip-networking/# skip-networking/g' /etc/my.cnf.d/mariadb-server.cnf
sed -i 's/#bind-address/bind-address/g' /etc/my.cnf.d/mariadb-server.cnf
service mariadb start
service mariadb stop
/usr/bin/mariadbd --basedir=/usr --datadir=/var/lib/mysql --plugin-dir=/usr/lib/mariadb/plugin --user=root --pid-file=/run/mysqld/mariadb.pid --skip-innodb --default-storage-engine=myisam
