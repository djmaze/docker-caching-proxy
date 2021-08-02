#!/bin/bash
set -euo pipefail

sed -i "s/\$MAX_SIZE/${MAX_SIZE:-10g}/" /etc/nginx/nginx.conf
sed -i "s/\$UPSTREAM/${UPSTREAM//\//\\/}/" /etc/nginx/nginx.conf
sed -i "s/\$GZIP/${GZIP:-on}/" /etc/nginx/nginx.conf

exec "$@"
