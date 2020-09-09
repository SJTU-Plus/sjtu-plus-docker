#!/bin/bash

set -e

docker-compose run --rm --service-ports sjtu-plus sh -c "python manage.py makemigrations && python manage.py showmigrations && python manage.py migrate"
