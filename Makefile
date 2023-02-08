APP_NAME='bbrs'

dev:
	@if [ ! -f .env ]; then \
		cp example.env .env; \
	fi

	@if [ ! -f .env.docker ]; then \
		cp example.env.docker .env.docker; \
	fi

	@docker-compose -f docker-compose.yml up

reload:
	@docker exec $(APP_NAME) sh -c "php artisan octane:reload"

rebuild:
	@docker-compose -f docker-compose.yml build --no-cache

npminstall:
	@docker exec $(APP_NAME) sh -c "npm install"

oinstall:
	@docker exec $(APP_NAME) sh -c "php artisan octane:install --server=swoole"

prepare:
	@docker exec $(APP_NAME) sh -c "php artisan key:generate; php artisan optimize;"

migrate:
	@docker exec $(APP_NAME) sh -c "php artisan migrate"

optimize:
	@docker exec $(APP_NAME) sh -c "php artisan optimize;"
