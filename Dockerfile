# Dockerfile for QloApps - Lightweight Hotel Management System
FROM php:8.1-apache

# Set working directory
WORKDIR /var/www/html

# Install system dependencies and PHP extensions
RUN apt-get update && apt-get install -y \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libzip-dev \
    libxml2-dev \
    libcurl4-openssl-dev \
    unzip \
    git \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) \
    gd \
    pdo_mysql \
    mysqli \
    curl \
    soap \
    zip \
    simplexml \
    dom \
    && a2enmod rewrite \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Configure PHP settings for QloApps
RUN echo "memory_limit = 128M" > /usr/local/etc/php/conf.d/memory-limit.ini \
    && echo "upload_max_filesize = 16M" > /usr/local/etc/php/conf.d/upload-limit.ini \
    && echo "post_max_size = 16M" >> /usr/local/etc/php/conf.d/upload-limit.ini \
    && echo "max_execution_time = 500" > /usr/local/etc/php/conf.d/execution-time.ini \
    && echo "allow_url_fopen = On" > /usr/local/etc/php/conf.d/url-fopen.ini

# Copy application files
COPY . /var/www/html/

# Set proper permissions
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html \
    && chmod -R 777 /var/www/html/cache \
    && chmod -R 777 /var/www/html/log \
    && chmod -R 777 /var/www/html/download \
    && chmod -R 777 /var/www/html/upload \
    && chmod -R 777 /var/www/html/img \
    && chmod -R 777 /var/www/html/config \
    && chmod -R 777 /var/www/html/themes \
    && chmod -R 777 /var/www/html/modules \
    && chmod -R 777 /var/www/html/mails \
    && chmod -R 777 /var/www/html/translations

# Configure Apache for QloApps
RUN echo '<Directory /var/www/html/>' > /etc/apache2/conf-available/qloapps.conf \
    && echo '    Options Indexes FollowSymLinks' >> /etc/apache2/conf-available/qloapps.conf \
    && echo '    AllowOverride All' >> /etc/apache2/conf-available/qloapps.conf \
    && echo '    Require all granted' >> /etc/apache2/conf-available/qloapps.conf \
    && echo '</Directory>' >> /etc/apache2/conf-available/qloapps.conf \
    && a2enconf qloapps

# Expose port 80
EXPOSE 80

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=40s --retries=3 \
    CMD curl -f http://localhost/ || exit 1

# Start Apache
CMD ["apache2-foreground"]
