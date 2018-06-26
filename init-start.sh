#!/bin/bash

service mysqld start
service nginx start
service php-fpm start

while true; do sleep 1d; done
