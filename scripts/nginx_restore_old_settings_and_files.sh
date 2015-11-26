#!/bin/sh
OLD_VERSION_NUM=1.9.5
NEW_VERSION_NUM=1.9.7

# stop nginx service first
echo "ready to stop nginx service ......"
service nginx status
service nginx stop
service nginx status
echo "done.\n"

# override configuration file with old one
echo "coping nginx.conf from /usr/local/$OLD_VERSION_NUM/conf/nginx.conf ......"
cd /usr/local/nginx-$NEW_VERSION_NUM/conf/
cp -fp /usr/local/nginx-$OLD_VERSION_NUM/conf/nginx.conf .
echo "done.\n"

# copy all of the config of virtualhost
echo "copying *.conf from /usr/local/$OLD_VERSION_NUM/conf/vhosts/ ......"
mkdir vhosts
cd ./vhosts
cp -fp /usr/local/nginx-$OLD_VERSION_NUM/conf/vhosts/*.conf .
echo "done.\n"

# test if any syntax error appear in nginx.conf ?
echo "nginx configuration syntax test ......"
cd /usr/local/nginx-$NEW_VERSION_NUM/
sbin/nginx -t -c conf/nginx.conf
echo "done.\n"

# copy root directories of websites from old installation path
cd /usr/local/nginx-$NEW_VERSION_NUM/
echo "copying whole phpMyAdmin dir ......"
cp -rp /usr/local/nginx-$OLD_VERSION_NUM/phpMyAdmin-4.5.0.2/ .
ln -s ./phpMyAdmin-4.5.0.2 ./phpmyadmin
echo "done.\n"

echo "copying whole icingaweb2 dir ......"
cp -rp /usr/local/nginx-$OLD_VERSION_NUM/icingaweb2/ .
echo "done.\n"

echo "copying whole zabbix dir ......"
cp -rp /usr/local/nginx-$OLD_VERSION_NUM/zabbix/ .
echo "done.\n"

# copy ssl directory from old installation path
sleep 1
echo "coping whole ssl dir ......"
cp -rp /usr/local/nginx-$OLD_VERSION_NUM/ssl/ .
echo "done.\n"
