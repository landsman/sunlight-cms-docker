FROM php:8.1-apache

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    libzip-dev

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN docker-php-ext-install mysqli pdo_mysql mbstring exif pcntl bcmath gd zip

# Enable Apache modules
RUN a2enmod rewrite

# Set working directory
WORKDIR /var/www/html

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install Sunlight CMS using Composer
RUN rm -rf /var/www/html/* && \
    composer create-project sunlight-cms/skeleton web --prefer-dist --no-interaction && \
    mv web/* web/.* /var/www/html/ 2>/dev/null || true && \
    rmdir web && \
    chown -R www-data:www-data /var/www/html

# Configure Apache
COPY apache-config.conf /etc/apache2/sites-available/000-default.conf

# Copy pre-filled configuration to a location that won't be overridden by volume mounts
COPY config.php /var/www/pre-filled-config.php

# Copy entrypoint script
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# Expose port 80
EXPOSE 80

# Set entrypoint
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD ["apache2-foreground"]
