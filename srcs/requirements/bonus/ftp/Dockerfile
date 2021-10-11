FROM alpine

RUN apk add --no-cache vsftpd supervisor openssl openssh

COPY tools/init.sh .

RUN yes "" | openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem 


CMD [ "sh", "init.sh" ]