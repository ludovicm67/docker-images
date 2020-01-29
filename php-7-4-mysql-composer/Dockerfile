FROM php:7.4-fpm-alpine

WORKDIR /app
EXPOSE 3000

# install required dependencies to enable php extensions
RUN apk add --no-cache \
  curl-dev \
  freetype-dev \
  libjpeg-turbo-dev \
  libpng-dev \
  libxml2-dev \
  libzip-dev \
  mysql-client

# configure PHP extensions
RUN docker-php-ext-configure gd \
  --with-freetype=/usr/include/ \
  --with-jpeg=/usr/include/ \
  && docker-php-ext-install \
    -j$(nproc) \
    curl \
    dom \
    gd \
    json \
    mysqli \
    pdo \
    pdo_mysql \
    xml \
    zip

# install composer
COPY --from=composer /usr/bin/composer /usr/bin/composer

# run php local server
CMD php -S 0.0.0.0:3000 -t /app
