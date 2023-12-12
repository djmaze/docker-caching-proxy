# Caching proxy docker image

[![Docker Pulls](https://img.shields.io/docker/pulls/decentralize/caching-proxy.svg)](https://hub.docker.com/r/decentralize/caching-proxy)
[![Build Status](https://ci.strahlungsfrei.de/api/badges/djmaze/docker-caching-proxy/status.svg)](https://ci.strahlungsfrei.de/djmaze/docker-caching-proxy)

Front your webserver containers with a transparent cache.

## What does it do?

This image runs an nginx server as a caching reverse proxy for a given URL. It can be used in conjunction with [Traefik](https://github.com/containous/traefik) in order to transparently cache chosen paths on a backend service.

## Usage

The container needs two environment variables:

* `UPSTREAM`: URL of the upstream service which should be cached
* `ALLOWED_ORIGIN`: origin URL which is allowed to load the files from this server (header `Access-Control-Allowed-Origins`) (default `*`)
* `MAX_SIZE`: Size of the cache to use (on-disk)
* `MAX_INACTIVE`: Maximum inactive time for cached items (default: 60m)
* `GZIP`: Set to `off` in order to disable gzip compression (enabled by default)
* `PROXY_READ_TIMEOUT`: Set the timeout for reading a response from the proxied server (default: 120s)
* `PROXY_CACHE_VALID`: Set caching time for 200, 301, and 302 responses (disabled by default)

The server will be listening on port 80.

See the supplied [docker-compose.yml](docker-compose.yml) for an example.
