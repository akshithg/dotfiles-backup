all: build run

build:
	docker build -t ubuntu-env .
	docker container prune -f
	docker image prune -f

run:
	docker run -it ubuntu-env
