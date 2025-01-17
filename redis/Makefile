REDIS_CPU = 0.5
REDIS_MEMORY = 1024m
REDIS_HOST_PORT = 6379

redis-build:
	@echo "> Building Redis..."
	@HOST_PORT=${REDIS_HOST_PORT} \
	MEMORY_LIMIT=${REDIS_MEMORY} \
	CPU_LIMIT=${REDIS_CPU} \
	docker compose build &> /dev/null
	@echo "> Redis image built"


redis-run:
	@echo "> Starting Redis..."
	@HOST_PORT=${REDIS_HOST_PORT} \
	MEMORY_LIMIT=${REDIS_MEMORY} \
	CPU_LIMIT=${REDIS_CPU} \
	docker compose up -d --wait --no-build &> /dev/null

	@echo "> Redis is running on http://localhost:${REDIS_HOST_PORT}"


redis-reset:
	@make redis-stop
	@make redis-build
	@make redis-run


redis-stop:
	@echo "> Stopping Redis..."
	@docker compose down &> /dev/null
	@echo "> Redis stopped"


help:
	@echo "Docker-based Redis setup"
	@echo ""
	@echo "Usage: make <command>"
	@echo ""
	@echo "Available commands:"
	@echo " - redis-build ............... Build Redis image"
	@echo " - redis-run ................. Run Redis container"
	@echo " - redis-reset ............... Rebuild and restart Redis container"
	@echo " - redis-stop ................ Stop Redis container"
	@echo " - help ...................... Show this help message"