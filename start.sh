#!/usr/bin/env bash
set -e

echo "[*] Stopping existing containers and removing volumes..."
docker compose down -v --remove-orphans

echo "[*] Building and starting fresh containers..."
docker compose up --build -d

echo "[*] Waiting for MySQL to fully start"
sleep 100  # Random sleep because mysql is soooooo sloooowwwwwwww !!!!!!!
