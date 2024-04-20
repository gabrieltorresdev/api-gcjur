#!/bin/sh

cd /var/www/html
php artisan migrate
php artisan optimize:clear