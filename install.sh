#!/bin/sh

#####
#
# Script to discover Apache logs
#
#####

#####
#
# finding Apache binary
#
#####

if [ -f /usr/sbin/httpd ]; then
    binary=/usr/sbin/httpd
fi
if [ -f /usr/sbin/apache ]; then
    binary=/usr/sbin/apache
fi
if [ -f /usr/sbin/apache2 ]; then
    binary=/usr/sbin/apache2
fi
if [ -f /usr/sbin/httpd2 ]; then
    binary=/usr/sbin/httpd2
fi

HTTPDROOT=$($binary -V | grep 'D HTTPD_ROOT=' | cut -f 2 -d'=' | tr -d '"')
. $HTTPDROOT/envvars
echo $APACHE_LOG_DIR > weblog.ini


