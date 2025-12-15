#!/usr/bin/env bash

if [ "$EUID" -ne 0 ]; then
  echo "Please run this script as root user"
  exit 1
fi

set -e

echo "[*] Stopping and removing containers/volumes"
docker compose down -v --remove-orphans

echo "[✓] Containers removed"
