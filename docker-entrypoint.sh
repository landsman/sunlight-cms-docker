#!/bin/bash
set -e

# Create config directory if it doesn't exist
mkdir -p /var/www/html/config

# Check if config.php exists in the mounted volume
if [ ! -f /var/www/html/config/config.php ]; then
    echo "Config file not found in mounted volume. Copying pre-filled config..."
    cp /var/www/pre-filled-config.php /var/www/html/config/config.php
    chown www-data:www-data /var/www/html/config/config.php
fi

# Execute the command passed to docker-entrypoint.sh
exec "$@"