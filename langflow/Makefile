LANGFLOW_CPU = 0.5
LANGFLOW_MEMORY = 1024m
LANGFLOW_HOST_PORT = 7860


langflow-build:
	@echo "> Building Langflow..."
	@HOST_PORT=${LANGFLOW_HOST_PORT} docker compose build -m ${LANGFLOW_MEMORY} &> /dev/null
	@echo "> Langflow image built"


langflow-run:
	@echo "> Starting Langflow..."
	@HOST_PORT=${LANGFLOW_HOST_PORT} \
	MEMORY_LIMIT=${LANGFLOW_MEMORY} \
	CPU_LIMIT=${LANGFLOW_CPU} \
	docker compose up -d --wait --no-build &> /dev/null
	@echo "> Langflow is running on http://localhost:${LANGFLOW_HOST_PORT}"


langflow-reset:
	@make langflow-stop
	@make langflow-build
	@make langflow-run


langflow-stop:
	@echo "> Stopping Langflow..."
	@docker compose down &> /dev/null
	@echo "> Langflow stopped"


help:
	@echo "Docker-based Langflow setup"
	@echo ""
	@echo "Usage: make <command>"
	@echo ""
	@echo "Available commands:"
	@echo " - langflow-build .......... Build Langflow image"
	@echo " - langflow-run ............ Run Langflow container"
	@echo " - langflow-reset .......... Rebuild and restart Langflow container"
	@echo " - langflow-stop ........... Stop Langflow container"
	@echo " - help ................... Show this help message"