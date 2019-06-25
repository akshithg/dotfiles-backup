run:
	docker-compose run dev

clean:
	docker container prune -f
	docker image prune -af
