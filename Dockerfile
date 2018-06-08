FROM php:7.2-apache

# Run updates
RUN apt-get update \
    && apt-get install -y

# Install/enable Xdebug
RUN pecl install xdebug \
    && docker-php-ext-enable xdebug

# Copy the xdebug config into the php.ini
RUN echo '[xdebug]' >> /usr/local/etc/php/php.ini
RUN echo 'zend_extension="/usr/local/lib/php/extensions/no-debug-non-zts-20151012/xdebug.so"' >> /usr/local/etc/php/php.ini
RUN echo 'xdebug.remote_port=9000' >> /usr/local/etc/php/php.ini
RUN echo 'xdebug.remote_enable=1' >> /usr/local/etc/php/php.ini
RUN echo 'xdebug.remote_connect_back=1' >> /usr/local/etc/php/php.ini

# Setting WORKDIR
WORKDIR /var/www/html

# Install App
COPY src/ /var/www/html