#!/bin/bash

set -e

git clone https://github.com/SJTU-Plus/course-plus statics/course-plus
git clone https://github.com/SJTU-Plus/course-plus-data statics/course-plus-data
git clone https://github.com/SJTU-Plus/sjtu-plus sjtu-plus
./update.sh
