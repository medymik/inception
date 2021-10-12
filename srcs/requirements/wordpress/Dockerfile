FROM alpine

# wget to download wordpress and redis plugin for wordpress
RUN apk add wget

# download wordpress
RUN wget https://wordpress.org/latest.tar.gz 

# extract wordpress
RUN tar -xvf latest.tar.gz

# add redis plugin
RUN wget https://downloads.wordpress.org/plugin/redis-cache.2.0.21.zip

# add unzip to extract the zip file
RUN apk add unzip

# unzip redis plugin
RUN unzip redis-cache.2.0.21.zip

# move redis plugin to the plugins directory
RUN mv redis-cache /wordpress/wp-content/plugins/

# COPY Wordpress prepared conf
COPY conf/wp-config.php /wordpress


# setup php fpm
RUN apk add --no-cache php7-fpm php7-mcrypt php7-soap php7-openssl php7-gmp php7-pdo_odbc php7-json php7-dom php7-pdo php7-zip php7-mysqli php7-sqlite3 php7-apcu php7-pdo_pgsql php7-bcmath php7-gd php7-odbc php7-pdo_mysql php7-pdo_sqlite php7-gettext php7-xmlreader php7-xmlrpc php7-bz2 php7-iconv php7-pdo_dblib php7-curl php7-ctype php7-redis

RUN sed -i 's/listen = 127.0.0.1:9000/listen = 0.0.0.0:9000/' /etc/php7/php-fpm.d/www.conf
RUN sed -i 's/user = nobody/user = root/g'  /etc/php7/php-fpm.d/www.conf
RUN sed -i 's/group = root/group = root/g'  /etc/php7/php-fpm.d/www.conf

# COPY init file
COPY tools/init.sh .

CMD ["sh", "init.sh"]
