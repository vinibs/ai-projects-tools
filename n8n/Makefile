N8N_CPU = 0.5
N8N_MEMORY = 1024m
N8N_HOST_PORT = 5678


n8n-build:
	@echo "> Building N8N..."
	@HOST_PORT=${N8N_HOST_PORT} docker compose build -m ${N8N_MEMORY} &> /dev/null
	@echo "> N8N image built"


n8n-run:
	@echo "> Starting N8N..."
	@HOST_PORT=${N8N_HOST_PORT} \
	MEMORY_LIMIT=${N8N_MEMORY} \
	CPU_LIMIT=${N8N_CPU} \
	docker compose up -d --no-build &> /dev/null
	@echo "> N8N is running on http://localhost:${N8N_HOST_PORT}"


n8n-reset:
	@make n8n-stop
	@make n8n-build
	@make n8n-run


n8n-stop:
	@echo "> Stopping N8N..."
	@docker compose down &> /dev/null
	@echo "> N8N stopped"


help:
	@echo "Docker-based N8N setup"
	@echo ""
	@echo "Usage: make <command>"
	@echo ""
	@echo "Available commands:"
	@echo " - n8n-build .............. Build N8N image"
	@echo " - n8n-run ................ Run N8N container"
	@echo " - n8n-reset .............. Rebuild and restart N8N container"
	@echo " - n8n-stop ............... Stop N8N container"
	@echo " - help ................... Show this help message"