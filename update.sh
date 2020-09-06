#!/bin/bash

set -e

echo "updating course-plus..."
(cd statics/course-plus && git fetch && git reset --hard origin/gh-pages)
echo "updating course-plus-data..."
(cd statics/course-plus-data && git fetch && git reset --hard origin/master)
echo "updating sjtu-plus..."
(cd sjtu-plus && git pull)
echo "restart database service..."
docker-compose up -d --build postgres-db
echo "rebuild sjtu-plus..."
docker-compose build sjtu-plus
echo "updating sjtu-plus data files..."
docker-compose run sjtu-plus rm -rf /data/*
docker-compose run sjtu-plus python manage.py collectstatic --noinput
echo "updating sjtu-plus database..."
docker-compose run sjtu-plus python manage.py makemigrations
docker-compose run sjtu-plus python manage.py migrate
echo "restarting all services..."

docker-compose up --build
