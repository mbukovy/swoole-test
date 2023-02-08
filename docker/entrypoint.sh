#!/bin/bash
set -e

CURRENT_HASH=$(grep -Po '"content-hash":.*?[^\\]",' composer.lock)

if [[ ! -f "storage/app/tmphash" ]] || [[ ! -d "vendor/" ]] || [[ "$CURRENT_HASH" != "$(cat storage/app/tmphash)" ]]; then
    composer install
fi

echo $CURRENT_HASH > storage/app/tmphash

# php artisan migrate

php artisan octane:start --port=5000

