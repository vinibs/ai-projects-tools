POSTGRES_CPU = 0.25
POSTGRES_MEMORY = 512m
POSTGRES_HOST_PORT = 5432


postgres-build:
	@echo "> Building Postgres..."
	@POSTGRES_HOST_PORT=${POSTGRES_HOST_PORT} \
	docker compose build -m ${POSTGRES_MEMORY} &> /dev/null
	@echo "> Postgres image built"


postgres-run:
	@echo "> Starting Postgres..."
	@POSTGRES_HOST_PORT=${POSTGRES_HOST_PORT} \
	MEMORY_LIMIT=${POSTGRES_MEMORY} \
	CPU_LIMIT=${POSTGRES_CPU} \
	docker compose up -d --no-build &> /dev/null
	@echo "> Postgres is running on http://localhost:${POSTGRES_HOST_PORT}"


postgres-reset:
	@make postgres-stop
	@make postgres-build
	@make postgres-run


postgres-stop:
	@echo "> Stopping Postgres..."
	@docker compose down &> /dev/null
	@echo "> Postgres stopped"


help:
	@echo "Docker-based Postgres setup"
	@echo ""
	@echo "Usage: make <command>"
	@echo ""
	@echo "Available commands:"
	@echo " - postgres-build .............. Build Postgres image"
	@echo " - postgres-run ................ Run Postgres container"
	@echo " - postgres-reset .............. Rebuild and restart Postgres container"
	@echo " - postgres-stop ............... Stop Postgres container"
	@echo " - help ........................ Show this help message"