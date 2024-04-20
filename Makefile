start:
	docker compose -f docker/docker-compose.yml up -d --build

stop:
	docker compose -f docker/docker-compose.yml down

shell:
	docker compose -f docker/docker-compose.yml exec -it app bash

.PHONY: start stop
