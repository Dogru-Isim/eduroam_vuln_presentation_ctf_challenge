#!/usr/bin/env bash
set -e

echo "[*] Stopping and removing containers/volumes"
docker compose down -v --remove-orphans

echo "[✓] Containers removed"
