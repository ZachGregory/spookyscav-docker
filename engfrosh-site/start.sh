#!/bin/bash
cd /home/ubuntu/
source ./environment
cd engfrosh/engfrosh_site/
nginx

sudo -E -u ubuntu -g www-data daphne -u /home/ubuntu/engfrosh/engfrosh_site/engfrosh_site.sock engfrosh_site.asgi:application
