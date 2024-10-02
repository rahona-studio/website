#!/bin/bash

COMPOSE="/usr/bin/docker compose --ansi"
DOCKER="/usr/bin/docker"

cd /home/mariot/rahona-studio/
$COMPOSE run certbot renew && $COMPOSE kill -s SIGHUP webserver
$DOCKER system prune -af
