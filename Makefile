run:
	docker-compose run dev

build:
	docker-compose build --no-cache dev

clean:
	docker container prune -f
	docker image prune -af
