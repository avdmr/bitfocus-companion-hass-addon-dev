#!/bin/bash
set -euo pipefail

DATA_DIR="/data/companion"

mkdir -p "$DATA_DIR"
chown -R companion:companion "$DATA_DIR"

# resolve huidige target (als het bestaat)
CURRENT_TARGET=""
if [ -e /companion ] || [ -L /companion ]; then
  CURRENT_TARGET="$(readlink -f /companion || true)"
fi

# Als /companion geen symlink is naar DATA_DIR: migreer + forceer
if [ "$CURRENT_TARGET" != "$DATA_DIR" ]; then
  if [ -d /companion ] && [ ! -L /companion ] && [ "$(ls -A /companion 2>/dev/null || true)" ]; then
    cp -a /companion/. "$DATA_DIR"/ || true
  fi

  rm -rf /companion
  ln -s "$DATA_DIR" /companion
fi

chown -R companion:companion /companion

# Allow Companion modules to read the config dir (/companion -> /data/companion)
export NODE_OPTIONS="${NODE_OPTIONS:-} \
 --permission \
 --allow-fs-read=* \
 --allow-fs-write=* \
 --allow-child-process \
 --allow-worker \
 --allow-addons"

export COMPANION_CONFIG_BASEDIR="/companion"
exec /docker-entrypoint.sh
