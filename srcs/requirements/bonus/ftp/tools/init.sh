echo "Create the user"
adduser -D $FTP_USER
echo "$FTP_USER:$FTP_PASSWORD" | /usr/sbin/chpasswd
echo "---------------------"

sed -i "s/anonymous_enable=YES/anonymous_enable=NO/" /etc/vsftpd/vsftpd.conf \
    && echo "local_enable=YES" >> /etc/vsftpd/vsftpd.conf \
    && echo "write_enable=YES" >> /etc/vsftpd/vsftpd.conf \
    && echo "local_umask=022" >> /etc/vsftpd/vsftpd.conf \
    && echo "dirmessage_enable=YES" >> /etc/vsftpd/vsftpd.conf \
    && echo "xferlog_enable=YES" >> /etc/vsftpd/vsftpd.conf \
    && echo "connect_from_port_20=YES" >> /etc/vsftpd/vsftpd.conf \
    && echo "xferlog_std_format=YES" >> /etc/vsftpd/vsftpd.conf \
    && echo "ftpd_banner=WELCOME TO FTPS :)" >> /etc/vsftpd/vsftpd.conf \
    && echo "chroot_local_user=YES" >> /etc/vsftpd/vsftpd.conf \
    && echo "listen=YES" >> /etc/vsftpd/vsftpd.conf \
    && echo "allow_writeable_chroot=YES" >> /etc/vsftpd/vsftpd.conf \
    && echo "pam_service_name=vsftpd" >> /etc/vsftpd/vsftpd.conf \
    && echo "seccomp_sandbox=NO" >> /etc/vsftpd/vsftpd.conf \
    && echo "ssl_enable=YES" >> /etc/vsftpd/vsftpd.conf \
    && echo "allow_anon_ssl=NO" >> /etc/vsftpd/vsftpd.conf \
    && echo "pasv_enable=YES" >> /etc/vsftpd/vsftpd.conf \
    && echo "rsa_cert_file=/etc/ssl/private/vsftpd.pem" >> /etc/vsftpd/vsftpd.conf \
    && echo "rsa_private_key_file=/etc/ssl/private/vsftpd.pem" >> /etc/vsftpd/vsftpd.conf \
    && echo "pasv_address=127.0.0.1" >> /etc/vsftpd/vsftpd.conf \
    && echo "pasv_addr_resolve=YES" >> /etc/vsftpd/vsftpd.conf \
    && echo "pasv_min_port=21000" >> /etc/vsftpd/vsftpd.conf \
    && echo "pasv_max_port=21000" >> /etc/vsftpd/vsftpd.conf

/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf