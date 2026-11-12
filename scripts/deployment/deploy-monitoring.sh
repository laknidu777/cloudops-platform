
#!/usr/bin/env bash

set -Eeuo pipefail

PROJECT_DIR="/opt/cloudops-platform"
COMPOSE_FILE="$PROJECT_DIR/compose.monitoring.yaml"
NETWORK_NAME="cloudops-monitoring"

echo "Starting CloudOps monitoring deployment..."

# Ensure Docker is running.
sudo systemctl start docker

# Create the shared network if it doesn't exist.
if ! sudo docker network inspect "$NETWORK_NAME" >/dev/null 2>&1; then
    sudo docker network create "$NETWORK_NAME"
fi

# Validate the monitoring configuration.
sudo docker compose \
    -p cloudops-platform \
    -f "$COMPOSE_FILE" \
    config -q

# Deploy or update monitoring services.
sudo docker compose \
    -p cloudops-platform \
    -f "$COMPOSE_FILE" \
    up -d

echo "Checking monitoring containers..."

sudo docker ps \
    --filter "name=cloudops-" \
    --format "table {{.Names}}\t{{.Status}}"

echo "CloudOps monitoring deployment completed."
