FROM php:8.3-fpm-alpine

WORKDIR /var/www/html

RUN apk update && apk add oniguruma-dev icu-dev libzip-dev autoconf build-base linux-headers

RUN docker-php-ext-install intl mbstring pcntl pdo_mysql zip bcmath

RUN pecl install xdebug-3.3.0
RUN docker-php-ext-enable xdebug
RUN echo "xdebug.start_with_request=yes" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.mode=debug" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.client_host=host.docker.internal" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.log_level=0" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.discover_client_host=0" >> /usr/local/etc/php/conf.d/xdebug.ini

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN addgroup -g 1000 app
RUN adduser -u 1000 -D -s /bin/bash -G app app

COPY --chown=app:www-data ./entrypoint.sh /docker/
RUN chmod +x /docker/entrypoint.sh

RUN chmod -R 777 /var/www/html

USER app

ENTRYPOINT ["/docker/entrypoint.sh"]