# docker build -t phpdocker .
# docker run -it --volume="$PWD:/app" --workdir="/app" --entrypoint=/bin/bash phpdocker:latest

FROM serversideup/php:8.3-cli

# Switch to root so we can do root things
USER root

# Install mago globally
RUN curl --proto '=https' --tlsv1.2 -sSf https://carthage.software/mago.sh | bash

ENV PHP_MEMORY_LIMIT="1G"
ENV PHP_OPCACHE_ENABLE=1

# Install the intl extension with root permissions
RUN install-php-extensions zip intl gmp exif opcache gd bcmath

RUN echo "opcache.interned_strings_buffer = 8" >> $PHP_INI_DIR/conf.d/opcache.ini \
 && echo "opcache.jit_buffer_size = 100M" >> $PHP_INI_DIR/conf.d/opcache.ini \
 && echo "opcache.jit = tracing" >> $PHP_INI_DIR/conf.d/opcache.ini

# Drop back to our unprivileged user
USER www-data
