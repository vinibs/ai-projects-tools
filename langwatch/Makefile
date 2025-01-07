LANGWATCH_CPU = 1.5
LANGWATCH_MEMORY = 1024m
LANGWATCH_HOST_PORT = 5560


langwatch-build:
	@echo "> Building Langwatch..."
	@LANGWATCH_HOST_PORT=${LANGWATCH_HOST_PORT} \
	docker compose build -m ${LANGWATCH_MEMORY}
	@echo "> Langwatch image built"


langwatch-run:
	@echo "> Starting Langwatch..."
	@LANGWATCH_HOST_PORT=${LANGWATCH_HOST_PORT} \
	MEMORY_LIMIT=${LANGWATCH_MEMORY} \
	CPU_LIMIT=${LANGWATCH_CPU} \
	docker compose up -d --wait --no-build --remove-orphans
	@echo "> Langwatch is running on http://localhost:${LANGWATCH_HOST_PORT}"


langwatch-reset:
	@make langwatch-stop
	@make langwatch-build
	@make langwatch-run


langwatch-stop:
	@echo "> Stopping Langwatch..."
	@docker compose down &> /dev/null
	@echo "> Langwatch stopped"


help:
	@echo "Docker-based Langwatch setup"
	@echo ""
	@echo "Usage: make <command>"
	@echo ""
	@echo "Available commands:"
	@echo " - langwatch-build .............. Build Langwatch image"
	@echo " - langwatch-run ................ Run Langwatch container"
	@echo " - langwatch-reset .............. Rebuild and restart Langwatch container"
	@echo " - langwatch-stop ............... Stop Langwatch container"
	@echo " - help ......................... Show this help message"