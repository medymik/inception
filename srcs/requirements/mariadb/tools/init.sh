if [ ! -f "/var/lib/mysql/ib_buffer_pool" ];
then
    /etc/init.d/mariadb setup &> /dev/null
    service mariadb start &> null
    # mysql --user=root < req.sql
    # mysql --user=root wordpress < wordpress.sql
    service mariadb stop
fi
chown -R root:root /var/lib/mysql
sed -i 's/skip-networking/# skip-networking/g' /etc/my.cnf.d/mariadb-server.cnf
sed -i 's/#bind-address/bind-address/g' /etc/my.cnf.d/mariadb-server.cnf
service mariadb start
service mariadb stop
/usr/bin/mariadbd --basedir=/usr --datadir=/var/lib/mysql --plugin-dir=/usr/lib/mariadb/plugin --user=root --pid-file=/run/mysqld/mariadb.pid
