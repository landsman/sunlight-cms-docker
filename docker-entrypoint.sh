#!/bin/bash
set -e

# Check if config.php exists in the web root
if [ ! -f /var/www/html/config.php ]; then
    echo "Config file not found in web root. Copying pre-filled config..."
    cp /var/www/pre-filled-config.php /var/www/html/config.php
    chown www-data:www-data /var/www/html/config.php
fi

# Execute the command passed to docker-entrypoint.sh
exec "$@"
