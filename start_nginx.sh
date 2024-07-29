#!/bin/sh
envsubst < /etc/nginx/nginx.conf.template\
| sed 's/__HOST__/\$host/g'\
| sed 's/__REMOTE_ADDR__/\$remote_addr/g'\
| sed 's/__PROXY_ADD_X_FORWARDED_FOR__/\$proxy_add_x_forwarded_for/g'\
| sed 's/__SCHEME__/\$scheme/g'\
| sed 's/__REQUEST_URI__/\$request_uri/g'\
 > /etc/nginx/nginx.conf

exec nginx -g 'daemon off;'
