OS := $(shell uname)

install:
	sh ./install.sh

migrate:
	docker-compose exec -T bartosz-lauks-projekt-indywidualny-php php bin/console doctrine:migrations:diff --no-interaction
	docker-compose exec -T bartosz-lauks-projekt-indywidualny-php php bin/console doctrine:migrations:migrate --no-interaction

diff_migrations:
	docker-compose exec -T bartosz-lauks-projekt-indywidualny-php php bin/console doctrine:migrations:diff --no-interaction

migrations:
	docker-compose exec -T bartosz-lauks-projekt-indywidualny-php php bin/console doctrine:migrations:migrate --no-interaction

composer_install:
	COMPOSER_ALLOW_SUPERUSER=1 docker-compose exec -T bartosz-lauks-projekt-indywidualny-php composer self-update
	COMPOSER_ALLOW_SUPERUSER=1 docker-compose exec -T bartosz-lauks-projekt-indywidualny-php composer install --no-interaction --classmap-authoritative --optimize-autoloader

composer_update:
	COMPOSER_ALLOW_SUPERUSER=1 docker-compose exec -T bartosz-lauks-projekt-indywidualny-php composer self-update
	COMPOSER_ALLOW_SUPERUSER=1 docker-compose exec -T bartosz-lauks-projekt-indywidualny-php composer update --no-interaction --classmap-authoritative --optimize-autoloader

build_dev_local:
	docker-compose -f docker-compose.yaml -f docker-compose-dev.local.yaml build

start_dev_local:
ifeq ($(OS),Darwin)
	docker volume create --name=bartosz-lauks-projekt-indywidualny-api-vendor-sync
	docker volume create --name=bartosz-lauks-projekt-indywidualny-api-app-sync
	docker-compose -f docker-compose.yaml -f docker-compose-dev.local.yaml up -d --remove-orphans
	docker-sync start
else
	docker-compose up -d
endif

stop_dev_local:
ifeq ($(OS),Darwin)
	docker-compose stop
	docker-sync stop
else
	docker-compose stop
endif

sync_clean:
ifeq ($(OS),Darwin)
	docker-sync clean
endif

build_prod:
	docker-compose -f docker-compose.yaml -f docker-compose-prod.yaml build

start_prod:
	docker-compose -f docker-compose.yaml -f docker-compose-prod.yaml up -d

build_stage:
	docker-compose -f docker-compose.yaml -f docker-compose-stage.yaml build

start_stage:
	docker-compose -f docker-compose.yaml -f docker-compose-stage.yaml up -d

build_dev:
	docker-compose -f docker-compose.yaml -f docker-compose-dev.yaml build

start_dev:
	docker-compose -f docker-compose.yaml -f docker-compose-dev.yaml up -d

stop:
	docker-compose down

execphp:
	docker-compose exec bartosz-lauks-projekt-indywidualny-php bash

execdb:
	docker-compose exec bartosz-lauks-projekt-indywidualny-mysql bash

restoreData:
	cat backup.sql | docker exec -i bartosz-lauks-projekt-indywidualny-mysql-dev /usr/bin/mysql -u root bartosz-lauks-projekt-indywidualny_dev