dev:
	docker-compose build sjtu-plus
	./migrate.sh
	docker-compose run -p 8080:8080 sjtu-plus sh -c "DEBUG=true python manage.py runserver 0.0.0.0:8080"

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
	docker-compose run sjtu-plus python manage.py createsuperuser
