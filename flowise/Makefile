FLOWISE_CPU = 0.5
FLOWISE_MEMORY = 1024m
FLOWISE_HOST_PORT = 3000
FLOWISE_USERNAME = admin
FLOWISE_PASSWORD = admin

ai-builder-reset:
	@make ai-builder-stop
	@make ai-builder-build
	@make ai-builder-run


ai-builder-stop:
	@echo "> Stopping AI Builder..."
	@docker stop ai-builder &> /dev/null || true
	@docker rm ai-builder &> /dev/null || true
	@echo "> AI Builder stopped"


flowise-build:
	@echo "> Building Flowise..."
	@HOST_PORT=${FLOWISE_HOST_PORT} \
	MEMORY_LIMIT=${FLOWISE_MEMORY} \
	CPU_LIMIT=${FLOWISE_CPU} \
	FLOWISE_USERNAME=${FLOWISE_USERNAME} \
	FLOWISE_PASSWORD=${FLOWISE_PASSWORD} \
	docker compose build &> /dev/null
	@echo "> Flowise image built"


flowise-run:
	@echo "> Starting Flowise..."
	@HOST_PORT=${FLOWISE_HOST_PORT} \
	MEMORY_LIMIT=${FLOWISE_MEMORY} \
	CPU_LIMIT=${FLOWISE_CPU} \
	FLOWISE_USERNAME=${FLOWISE_USERNAME} \
	FLOWISE_PASSWORD=${FLOWISE_PASSWORD} \
	docker compose up -d --wait --no-build &> /dev/null

	@echo "> Flowise is running on http://localhost:${FLOWISE_HOST_PORT}"


flowise-reset:
	@make flowise-stop
	@make flowise-build
	@make flowise-run


flowise-stop:
	@echo "> Stopping Flowise..."
	@docker compose down &> /dev/null
	@echo "> Flowise stopped"


help:
	@echo "Docker-based Flowise setup"
	@echo ""
	@echo "Usage: make <command>"
	@echo ""
	@echo "Available commands:"
	@echo " - flowise-build ............. Build Flowise image"
	@echo " - flowise-run ............... Run Flowise container"
	@echo " - flowise-reset ............. Rebuild and restart Flowise container"
	@echo " - flowise-stop .............. Stop Flowise container"
	@echo ""
	@echo " - help ...................... Show this help message"