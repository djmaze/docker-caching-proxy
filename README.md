# Caching proxy docker image
[![Docker Pulls](https://img.shields.io/docker/pulls/decentralize/caching-proxy.svg)](https://hub.docker.com/r/decentralize/caching-proxy)
[![Build Status](https://ci.strahlungsfrei.de/api/badges/djmaze/caching-proxy/status.svg)](https://ci.strahlungsfrei.de/djmaze/caching-proxy)

Front your webserver containers with a transparent cache.

## What does it do?

This image runs an nginx server as a caching reverse proxy for a given URL. It can be used in conjunction with [Traefik](https://github.com/containous/traefik) in order to transparently cache chosen paths on a backend service.

## Usage

The container needs two environment variables:

* `UPSTREAM`: URL of the upstream service which should be cached
* `MAX_SIZE`: Size of the cache to use (on-disk)

The server will be listening on port 80.

See the supplied [docker-compose.yml](docker-compose.yml) for an example.
