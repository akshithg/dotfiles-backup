all:
	@echo "## Targets ##"
	@echo "run: runs docker container with these dotfile setup"
	@echo "build: rebuilds docker container"
	@echo "install: installs dotfiles for current user"

docker:
	docker-compose run dev

install:
	install

clean:
	docker container prune -f
	docker image prune -af
