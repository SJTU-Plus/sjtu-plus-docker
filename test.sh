#!/bin/bash

set -e

docker-compose run --rm sjtu-plus sh -c "python app/manage.py test"
