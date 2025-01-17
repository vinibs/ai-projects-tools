MONGODB_CPU = 0.5
MONGODB_MEMORY = 512m
MONGODB_HOST_PORT = 27017


mongodb-build:
	@echo "> Building MongoDB..."
	@MONGODB_HOST_PORT=${MONGODB_HOST_PORT} \
	docker compose build -m ${MONGODB_MEMORY} &> /dev/null
	@echo "> MongoDB image built"


mongodb-run:
	@echo "> Starting MongoDB..."
	@MONGODB_HOST_PORT=${MONGODB_HOST_PORT} \
	MEMORY_LIMIT=${MONGODB_MEMORY} \
	CPU_LIMIT=${MONGODB_CPU} \
	docker compose up -d --wait --no-build --remove-orphans &> /dev/null
	@echo "> MongoDB is running on http://localhost:${MONGODB_HOST_PORT}"


mongodb-reset:
	@make mongodb-stop
	@make mongodb-build
	@make mongodb-run


mongodb-stop:
	@echo "> Stopping MongoDB..."
	@docker compose down &> /dev/null
	@echo "> MongoDB stopped"


help:
	@echo "Docker-based MongoDB setup"
	@echo ""
	@echo "Usage: make <command>"
	@echo ""
	@echo "Available commands:"
	@echo " - mongodb-build .............. Build MongoDB image"
	@echo " - mongodb-run ................ Run MongoDB container"
	@echo " - mongodb-reset .............. Rebuild and restart MongoDB container"
	@echo " - mongodb-stop ............... Stop MongoDB container"
	@echo " - help ....................... Show this help message"