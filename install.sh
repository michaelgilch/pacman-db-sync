#!/bin/bash
# 
# Installation script for pacman-db-sync
#
# Michael Gilchrist

INST_DIR="/opt/pacman-db-sync"
SERVICE_DIR="/etc/systemd/system"


if [[ $EUID -ne 0 ]]; then
	echo "This script must be run as root."
	exit 1
fi

# Remove existing installation, if it exists
[ -d "$INST_DIR" ] && rm -rf "$INST_DIR"

# Create new dir for installation
mkdir -pv "$INST_DIR"

# Copy all files to installation directory
cp ./* "$INST_DIR"

# Copy services to appropriate location
cp pacman-db-sync.service "$SERVICE_DIR"
cp pacman-db-sync.timer "$SERVICE_DIR"

# Start and enable the service
systemctl start pacman-db-sync.timer
systemctl enable pacman-db-sync.timer
