#!/usr/bin/env bash

if [ "$EUID" -ne 0 ]; then
  echo "Please run this script as root user"
  exit 1
fi

set -e

# Install docker compose plugin
echo "[*] Installing the docker compose plugin"

apt update
apt install ca-certificates curl
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/ubuntu
Suites: $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}")
Components: stable
Signed-By: /etc/apt/keyrings/docker.asc
EOF

sudo apt update
apt install docker-compose-plugin

echo "[*] Docker compose plugin installed"


echo "[*] Stopping existing containers and removing volumes..."
docker compose down -v --remove-orphans

echo "[*] Building and starting fresh containers..."
docker compose up --build -d

echo "[*] Waiting for MySQL to fully start"
sleep 100  # Random sleep because mysql is soooooo sloooowwwwwwww !!!!!!!
