FROM debian:buster
MAINTAINER Léo Martin <lmartin@42.student.fr>

COPY srcs/localhost /etc/nginx/sites-available/
COPY srcs/wordpress.zip /var/www/
COPY srcs/wordpress.sql /var/www/
COPY srcs/init.sql /var/www/
COPY srcs/service_start.sh .
CMD bash service_start.sh && tail -f /dev/null
