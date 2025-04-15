#!/bin/bash

EXPORT_DIR="./docs"
CONTAINER_NAME=$(docker compose ps -q wordpress)

if [ -z "$CONTAINER_NAME" ]; then
  echo "❌ WordPress container not running. Run 'npm start' first."
  exit 1
fi

echo "📦 Exporting static site to $EXPORT_DIR..."

# Clean and create docs folder
rm -rf $EXPORT_DIR
mkdir -p $EXPORT_DIR

# Use WP CLI inside the container (replace with your static export plugin logic)
docker exec -it "$CONTAINER_NAME" wp help > /dev/null 2>&1
if [ $? -ne 0 ]; then
  echo "❌ WP CLI is not available inside the container."
  exit 1
fi

# Optional: call wp plugin export or generate static pages via plugin
# Example: just copying index.php as placeholder
docker exec "$CONTAINER_NAME" cp /var/www/html/index.php /var/www/html/wp-content/index.php
docker cp "$CONTAINER_NAME":/var/www/html/wp-content/index.php "$EXPORT_DIR/index.html"

# Write CNAME file (if got CNAME)
#echo "www.yourdomainname.com" > "$EXPORT_DIR/CNAME"

echo "✅ Export complete: $EXPORT_DIR"
