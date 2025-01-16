LANGFUSE_CPU = 0.5
LANGFUSE_MEMORY = 1024m
LANGFUSE_HOST_PORT = 3001

langfuse-build:
	@echo "> Building Langfuse..."
	@@HOST_PORT=${LANGFUSE_HOST_PORT} \
	MEMORY_LIMIT=${LANGFUSE_MEMORY} \
	CPU_LIMIT=${LANGFUSE_CPU} \
	docker compose build &> /dev/null
	@echo "> Langfuse image built"


langfuse-run:
	@echo "> Starting Langfuse..."
	@HOST_PORT=${LANGFUSE_HOST_PORT} \
	MEMORY_LIMIT=${LANGFUSE_MEMORY} \
	CPU_LIMIT=${LANGFUSE_CPU} \
	docker compose up -d --wait --no-build &> /dev/null

	@echo "> Langfuse is running on http://localhost:${LANGFUSE_HOST_PORT}"


langfuse-reset:
	@make langfuse-stop
	@make langfuse-build
	@make langfuse-run


langfuse-stop:
	@echo "> Stopping Langfuse..."
	@docker compose down &> /dev/null
	@echo "> Langfuse stopped"


help:
	@echo "Docker-based Langfuse setup"
	@echo ""
	@echo "Usage: make <command>"
	@echo ""
	@echo "Available commands:"
	@echo " - langfuse-build ............... Build Langfuse image"
	@echo " - langfuse-run ................. Run Langfuse container"
	@echo " - langfuse-reset ............... Rebuild and restart Langfuse container"
	@echo " - langfuse-stop ................ Stop Langfuse container"
	@echo " - help ......................... Show this help message"