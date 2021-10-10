FROM alpine:3.14

RUN apk add --no-cache mariadb mariadb-client
RUN apk add openrc && openrc > /dev/null
RUN touch /run/openrc/softlevel
# /etc/init.d/mariadb setup
COPY tools/init.sh .

CMD sh init.sh