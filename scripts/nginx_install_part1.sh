#!/bin/sh
cd /usr/local/src
wget http://nginx.org/download/nginx-1.9.7.tar.gz
tar -zxvf ./nginx-1.9.7.tar.gz
chown -R root:root ./nginx-1.9.7
cd ./nginx-1.9.7
./configure --prefix=/usr/local/nginx-1.9.7 \
 --user=www-data \
 --group=www-data \
 --with-http_ssl_module \
 --with-pcre=/usr/local/src/pcre-8.37 \
 --with-zlib=/usr/local/src/zlib-1.2.8 \
 --with-openssl=/usr/local/src/openssl-1.0.2d \
 --with-http_stub_status_module

make
make install

chown -R root:www-data /usr/local/nginx-1.9.7
chmod -R g+w /usr/local/nginx-1.9.7
