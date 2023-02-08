FROM phpswoole/swoole:5.0.1-php8.2

ARG PROJECT_ROOT='/app'
ENV PROJECT_ROOT ${PROJECT_ROOT}

WORKDIR ${PROJECT_ROOT}

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
     curl \
     git \
     iproute2 \
     gnupg2 \
     libyaml-dev \
     libxml2-dev \
     libzip-dev \
     libonig-dev \
     libfreetype6-dev \
     zlib1g-dev \
     netcat \
     unzip \
     nodejs \
     npm; \
    pecl install yaml && echo "extension=yaml.so" > /usr/local/etc/php/conf.d/ext-yaml.ini ; \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN echo "memory_limit=2048M" > ${PHP_INI_DIR}/conf.d/memory-limit.ini

COPY . ${PROJECT_ROOT}

COPY docker/entrypoint.sh /entrypoint.sh
RUN chmod 775 /entrypoint.sh

RUN chmod -R o+rw bootstrap storage;

# clean up
#RUN docker-php-source delete ; \
#    apt-get -y purge ; \
#    apt-get -y clean 2>/dev/null && apt-get -y autoremove 2>/dev/null ; \
#    rm -rf /tmp/* /var/cache/* /var/lib/apt/lists/*;

ENTRYPOINT ["/entrypoint.sh"]
