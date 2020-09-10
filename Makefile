build:
	docker-compose build sjtu-plus

dev: build
	docker-compose build sjtu-plus
	docker-compose run -p 8080:8080 sjtu-plus sh -c "DEBUG=true python app/manage.py runserver 0.0.0.0:8080"

migrate:
	./migrate.sh

stop:
	docker-compose stop

devsql:
	docker-compose exec postgres-db psql user=sjtu-plus

init:
	./init.sh

update:
	git pull
	./update.sh

admin:
	docker-compose run sjtu-plus python app/manage.py createsuperuser

dump:
	docker-compose run sjtu-plus python app/manage.py dumpdata

load: build
	docker-compose run sjtu-plus python app/manage.py loaddata "app/data/test_data.json"

test: build
	docker-compose run --no-dep sjtu-plus sh -c "CI=true tools/test.sh"
