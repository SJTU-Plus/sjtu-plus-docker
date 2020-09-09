#!/bin/bash

set -e

echo "updating course-plus..."
(cd statics/course-plus && git fetch && git reset --hard origin/gh-pages)
echo "updating course-plus-data..."
(cd statics/course-plus-data && git fetch && git reset --hard origin/master)
echo "updating sjtu-plus..."
(cd sjtu-plus && git pull)
echo "rebuild sjtu-plus..."
docker-compose build sjtu-plus
echo "updating sjtu-plus data files..."
docker-compose run --rm sjtu-plus sh -c "rm -rf /data/* && python manage.py collectstatic --noinput"
echo "updating sjtu-plus database..."
./migrate.sh

echo "rebuild all services..."
docker-compose build
