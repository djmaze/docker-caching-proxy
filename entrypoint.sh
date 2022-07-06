#!/bin/bash
set -euo pipefail

sed -i "s|\$MAX_SIZE|${MAX_SIZE:-10g}|" /etc/nginx/nginx.conf
sed -i "s|\$UPSTREAM|${UPSTREAM}|" /etc/nginx/nginx.conf
sed -i "s|\$GZIP|${GZIP:-on}|" /etc/nginx/nginx.conf
sed -i "s|\$ALLOWED_ORIGIN|${ALLOWED_ORIGIN:-*}|" /etc/nginx/nginx.conf
sed -i "s|\$PROXY_READ_TIMEOUT|${PROXY_READ_TIMEOUT:-120s}|" /etc/nginx/nginx.conf

if [[ "${PROXY_CACHE_VALID+x}" ]]; then
  PROXY_CACHE_VALID="proxy_cache_valid ${PROXY_CACHE_VALID};"
fi
sed -i "s|\$PROXY_CACHE_VALID|${PROXY_CACHE_VALID-}|" /etc/nginx/nginx.conf

exec "$@"
