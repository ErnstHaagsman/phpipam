FROM php:7.2-apache

RUN a2enmod rewrite

RUN apt-get update && apt-get install --no-install-recommends -y \
        libgmp3-dev \
        libpng-dev \
        && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-install \
        sockets \
        gmp \
        gettext \
        pdo_mysql \
        gd

ADD . /var/www/html
