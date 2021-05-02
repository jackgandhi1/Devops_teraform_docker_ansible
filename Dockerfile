FROM centos:7

RUN yum install epel-release -y && yum update -y && yum install httpd -y && yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm -y && yum install yum-utils -y && yum-config-manager --enable remi-php74 && yum install php php-cli php-gd php-common -y

COPY ./index.php /var/www/html

EXPOSE 80 443

ENTRYPOINT ["/usr/sbin/httpd"]

CMD ["-D", "FOREGROUND"]

