setup:
	docker-compose build

install_gems:
	docker-compose run --rm app bundle install -j8

start:
	docker-compose up