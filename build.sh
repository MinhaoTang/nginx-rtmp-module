#!/bin/bash
sudo apt-get install build-essential libpcre3 libpcre3-dev libssl-dev
wget http://nginx.org/download/nginx-1.12.2.tar.gz
tar -zxvf nginx-1.12.2.tar.gz
cd nginx-1.12.2/
./configure --with-http_ssl_module --add-module=../../nginx-rtmp-module/
make -j
sudo make install
cd ..

# nginx init
sudo wget https://raw.github.com/JasonGiedymin/nginx-init-ubuntu/master/nginx -O /etc/init.d/nginx
sudo chmod +x /etc/init.d/nginx
sudo update-rc.d nginx defaults

# Generate config file
sudo service nginx start
sudo service nginx stop

# mv rtmp config file
sudo mv nginx.conf /usr/local/nginx/conf/

# start service
sudo service nginx restart
