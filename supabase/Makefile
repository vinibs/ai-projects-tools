SUPABASE_CPU = 0.5
SUPABASE_MEMORY = 1024m
SUPABASE_HOST_HTTP_PORT = 8000
SUPABASE_HOST_HTTPS_PORT = 8443

SUPABASE_USER = supabase
SUPABASE_PASSWORD = supabase

supabase-build:
	@echo "> Building Supabase..."
	@HOST_PORT=${SUPABASE_HOST_HTTP_PORT} \
	HOST_HTTPS_PORT=${SUPABASE_HOST_HTTPS_PORT} \
	DASHBOARD_USERNAME=${SUPABASE_USER} \
	DASHBOARD_PASSWORD=${SUPABASE_PASSWORD} \
	MEMORY_LIMIT=${SUPABASE_MEMORY} \
	CPU_LIMIT=${SUPABASE_CPU} \
	docker compose -f docker-compose.yml -f docker-compose.s3.yml build &> /dev/null
	@echo "> Supabase image built"


supabase-run:
	@echo "> Starting Supabase..."
	@HOST_PORT=${SUPABASE_HOST_HTTP_PORT} \
	HOST_HTTPS_PORT=${SUPABASE_HOST_HTTPS_PORT} \
	MEMORY_LIMIT=${SUPABASE_MEMORY} \
	CPU_LIMIT=${SUPABASE_CPU} \
	docker compose -f docker-compose.yml -f docker-compose.s3.yml up -d --no-build &> /dev/null

	@sleep 10
	@echo "> Supabase is running on http://localhost:${SUPABASE_HOST_HTTP_PORT}"


supabase-reset:
	@make supabase-stop
	@make supabase-build
	@make supabase-run


supabase-stop:
	@echo "> Stopping Supabase..."
	@docker compose -f docker-compose.yml -f docker-compose.s3.yml down &> /dev/null
	@echo "> Supabase stopped"


help:
	@echo "Docker-based Supabase setup"
	@echo ""
	@echo "Usage: make <command>"
	@echo ""
	@echo "Available commands:"
	@echo " - supabase-build ............... Build Supabase image"
	@echo " - supabase-run ................. Run Supabase container"
	@echo " - supabase-reset ............... Rebuild and restart Supabase container"
	@echo " - supabase-stop ................ Stop Supabase container"
	@echo " - help ......................... Show this help message"