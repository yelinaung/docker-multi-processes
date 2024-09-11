#!/bin/bash

/usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf &
child=$!

term_handler() {
  echo "[SHELL] Received SIGTERM. Shutting down gracefully..."
  kill -TERM "$child"

  wait "$child"

  echo "[SHELL] All processes have been terminated."
  exit 0
}

trap 'term_handler' SIGTERM
wait "$child"
