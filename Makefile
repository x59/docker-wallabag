.PHONY: pull up start restart stop down

include .env

env:
	echo ${MYSQL_PASSWORD}

pull:
	docker-compose -f docker-compose.yml -f docker-compose-${DB_TYPE}.yml pull

up:
	docker-compose -f docker-compose.yml -f docker-compose-${DB_TYPE}.yml up -d

start:
	docker-compose -f docker-compose.yml -f docker-compose-${DB_TYPE}.yml start

restart:
	docker-compose -f docker-compose.yml -f docker-compose-${DB_TYPE}.yml restart

stop:
	docker-compose -f docker-compose.yml -f docker-compose-${DB_TYPE}.yml stop

down:
	docker-compose -f docker-compose.yml -f docker-compose-${DB_TYPE}.yml down -v --rmi all
