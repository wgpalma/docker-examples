FROM centos:7

RUN \
yum -y install httpd php php-cli php-common \
mod_ssl openssl

WORKDIR /var/www/html

COPY index.html .

CMD apachectl -DFOREGROUND