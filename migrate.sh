#!/bin/bash

set -e

docker-compose run --rm --service-ports sjtu-plus sh -c "\
    python app/manage.py makemigrations && \
    python app/manage.py showmigrations && \
    python app/manage.py migrate"
