
# INSTALL & UPDATE
apt-get update
apt-get install -y wget
apt-get install -y nginx
apt-get install -y mariadb-server
apt-get install -y php
apt-get install -y php-cli php-fpm php-cgi
apt-get install -y php-mysql
apt-get install -y php-mbstring
apt-get install -y openssl
apt-get install -y zip

# WORDPRESS
unzip /var/www/wordpress.zip -d /var/www/

# ZIP DOWNLOADING APACHE 2 ???? xD
apt-get purge -y apache2

# MYSQL
service mysql start
mysql < /var/www/init.sql
mysql wordpress -u root --password=  < /var/www/wordpress.sql

# LINK SITE
ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/
chown -R www-data:www-data /var/www/*
chmod -R 755 /var/www/*

# RUN PHP
/etc/init.d/php7.3-fpm start

# SSL
mkdir ~/mkcert && \
  cd ~/mkcert && \
  wget https://github.com/FiloSottile/mkcert/releases/download/v1.1.2/mkcert-v1.1.2-linux-amd64 && \
  mv mkcert-v1.1.2-linux-amd64 mkcert && \
  chmod +x mkcert
./mkcert -install
./mkcert localhost

# START
service nginx start
