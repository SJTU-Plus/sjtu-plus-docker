#!/bin/bash

set -e

[ ! -d "statics/course-plus" ] && git clone --depth=1 --branch gh-pages https://github.com/SJTU-Plus/course-plus statics/course-plus
[ ! -d "statics/course-plus-data" ] && git clone --depth=1 https://github.com/SJTU-Plus/course-plus-data statics/course-plus-data
[ ! -d "sjtu-plus" ] && git clone --depth=1 https://github.com/SJTU-Plus/sjtu-plus sjtu-plus
[ ! -d "services/sjtu_traffic_exporter" ] && git clone --depth=1 https://github.com/SJTU-Plus/sjtu_traffic_exporter services/sjtu_traffic_exporter
[ ! -d "statics/libsjtu" ] && git clone --depth=1 --branch gh-pages https://github.com/SJTU-Plus/libsjtu/ statics/libsjtu

echo "Finished!"