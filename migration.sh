#!/bin/bash

# Получение ID контейнера
FLASK_CONTAINER_ID=$1

# Выполнение команд миграции
docker exec -it $FLASK_CONTAINER_ID flask db init
docker exec -it $FLASK_CONTAINER_ID flask db migrate -m "Initial migration"
docker exec -it $FLASK_CONTAINER_ID flask db upgrade
