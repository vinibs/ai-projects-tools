QDRANT_CPU = 0.25
QDRANT_MEMORY = 512m
QDRANT_REST_HOST_PORT = 6333
QDRANT_GRPC_HOST_PORT = 6334


qdrant-build:
	@echo "> Building Qdrant..."
	@QDRANT_REST_HOST_PORT=${QDRANT_REST_HOST_PORT} \
	QDRANT_GRPC_HOST_PORT=${QDRANT_GRPC_HOST_PORT} \
	docker compose build -m ${QDRANT_MEMORY} &> /dev/null
	@echo "> Qdrant image built"


qdrant-run:
	@echo "> Starting Qdrant..."
	@QDRANT_REST_HOST_PORT=${QDRANT_REST_HOST_PORT} \
	QDRANT_GRPC_HOST_PORT=${QDRANT_GRPC_HOST_PORT} \
	MEMORY_LIMIT=${QDRANT_MEMORY} \
	CPU_LIMIT=${QDRANT_CPU} \
	docker compose up -d --no-build &> /dev/null
	@echo "> Qdrant is running on http://localhost:${QDRANT_REST_HOST_PORT}/dashboard"


qdrant-reset:
	@make qdrant-stop
	@make qdrant-build
	@make qdrant-run


qdrant-stop:
	@echo "> Stopping Qdrant..."
	@docker compose down &> /dev/null
	@echo "> Qdrant stopped"


help:
	@echo "Docker-based Qdrant setup"
	@echo ""
	@echo "Usage: make <command>"
	@echo ""
	@echo "Available commands:"
	@echo " - qdrant-build .............. Build Qdrant image"
	@echo " - qdrant-run ................ Run Qdrant container"
	@echo " - qdrant-reset .............. Rebuild and restart Qdrant container"
	@echo " - qdrant-stop ............... Stop Qdrant container"
	@echo " - help ...................... Show this help message"