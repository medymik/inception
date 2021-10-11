sed -i "s/server_name/server_name $DOMAIN_NAME;/g" /etc/nginx/nginx.conf
nginx -g "daemon off;"
