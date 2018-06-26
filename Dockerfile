FROM centos:6
MAINTAINER Tien Vo <tienvv.it@gmail.com>
RUN yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm
RUN yum install -y http://rpms.remirepo.net/enterprise/remi-release-6.rpm
RUN yum -y update
RUN yum install -y yum-utils
RUN yum-config-manager --enable remi-php72
RUN yum install -y php php-mcrypt php-cli php-gd php-curl php-mysql php-ldap php-zip php-fileinfo php-dom php-mbstring php-fpm
RUN yum -y install nginx
RUN yum -y install http://dev.mysql.com/get/mysql57-community-release-el6-7.noarch.rpm
RUN yum-config-manager --enable mysql56-community
RUN yum -y install mysql-community-server

EXPOSE 8080
EXPOSE 9000
EXPOSE 3306

ADD init-start.sh /init-start.sh
RUN chmod +x /init-start.sh
# Default command
ENTRYPOINT ["/init-start.sh"]

