FROM alpine:3.14

RUN apk add --no-cache nginx
RUN apk add --no-cache openssl

# cert
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/CN=localhost"

COPY conf/nginx.conf /etc/nginx/nginx.conf

CMD nginx -g "daemon off;"
