FROM php:8.1.0-cli

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

ENV COMPOSER_ALLOW_SUPERUSER 1
ENV BUILD_DEPS="autoconf file pkg-config re2c libgmp-dev"
ENV LIB_DEPS="zlib1g-dev libzip-dev"
ENV TOOL_DEPS="git build-essential"
ENV ICU_RELEASE=68.2
ENV CXXFLAGS "--std=c++0x"

RUN apt-get update && apt-get install -y --no-install-recommends $BUILD_DEPS $LIB_DEPS $TOOL_DEPS && rm -rf /var/lib/apt/lists/* \
 && echo "date.timezone=UTC" >> $PHP_INI_DIR/php.ini \
 && docker-php-ext-install zip \
 && cd /tmp && curl -Ls https://github.com/unicode-org/icu/releases/download/release-$(echo $ICU_RELEASE | tr '.' '-')/icu4c-$(echo $ICU_RELEASE | tr '.' '_')-src.tgz > icu4c-src.tgz \
 && cd /tmp && tar xzf icu4c-src.tgz && cd /tmp/icu/source && echo "#define FALSE 0" >> config.h && echo "#define TRUE 1" >> config.h && ./runConfigureICU Linux && make && make install && rm -rf /tmp/icu /tmp/icu4c-src.tgz \
 && docker-php-ext-configure intl && docker-php-ext-install intl \
 && docker-php-ext-configure intl && docker-php-ext-install gmp \
 && docker-php-ext-configure opcache && docker-php-ext-install opcache \
 && chmod +x /usr/local/bin/install-php-extensions && install-php-extensions gd bcmath \
 && echo "memory_limit = 512M" > $PHP_INI_DIR/conf.d/memory-limit.ini \
 && echo "opcache.enable = 1" > $PHP_INI_DIR/conf.d/opcache.ini \
 && echo "opcache.enable_cli = 1" >> $PHP_INI_DIR/conf.d/opcache.ini \
 && echo "opcache.jit_buffer_size = 100M" >> $PHP_INI_DIR/conf.d/opcache.ini \
 && echo "opcache.jit = tracing" >> $PHP_INI_DIR/conf.d/opcache.ini \
 && apt-get purge -y --auto-remove $BUILD_DEPS

COPY --from=composer /usr/bin/composer /usr/bin/composer

CMD icu-config --version && php -i | grep 'ICU version'
