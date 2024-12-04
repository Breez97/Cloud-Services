#!/bin/bash

FLASK_CONTAINER_ID=$(docker ps -q --filter "ancestor=cloud-services-web" | head -n 1)

if [ -z "$FLASK_CONTAINER_ID" ]; then
    echo "Flask container not found"
    exit 1
fi

echo "Running migrations on container ID: $FLASK_CONTAINER_ID"
docker exec -it $FLASK_CONTAINER_ID flask db init
docker exec -it $FLASK_CONTAINER_ID flask db migrate -m "Initial migration"
docker exec -it $FLASK_CONTAINER_ID flask db upgrade
echo "Database migration completed."