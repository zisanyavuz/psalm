#!/bin/sh
set -e

if [ "${1:0:1}" = "-" ]; then
  set -- /sbin/tini -- php /vendor/bin/psalm "$@"
elif [ "$1" = "/vendor/bin/psalm" ]; then
  set -- /sbin/tini -- php "$@"
elif [ "$1" = "psalm" ]; then
  set -- /sbin/tini -- php /vendor/bin/"$@"
fi

exec "$@"
