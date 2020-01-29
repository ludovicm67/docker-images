FROM php:7.1-fpm-alpine

WORKDIR /app

# install required dependencies to enable php extensions
RUN apk add --no-cache \
  curl-dev \
  freetype-dev \
  libjpeg-turbo-dev \
  libpng-dev \
  libxml2-dev \
  mysql-client

# configure PHP extensions
RUN docker-php-ext-configure gd \
  --with-freetype-dir=/usr/include/ \
  --with-jpeg-dir=/usr/include/ \
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
