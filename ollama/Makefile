OLLAMA_CPU = 8.0
OLLAMA_MEMORY = 4096m
OLLAMA_HOST_PORT = 11434

ollama-build:
	@echo "> Building Ollama..."
	@HOST_PORT=${OLLAMA_HOST_PORT} \
	MEMORY_LIMIT=${OLLAMA_MEMORY} \
	CPU_LIMIT=${OLLAMA_CPU} \
	docker compose build &> /dev/null
	@echo "> Ollama image built"


ollama-run:
	@echo "> Starting Ollama..."
	@HOST_PORT=${OLLAMA_HOST_PORT} \
	MEMORY_LIMIT=${OLLAMA_MEMORY} \
	CPU_LIMIT=${OLLAMA_CPU} \
	docker compose up -d --wait --no-build &> /dev/null

	@echo "> Ollama is running on http://localhost:${OLLAMA_HOST_PORT}"
	@echo "> Check available models to run at https://ollama.com/library"
	@echo "> Check out the REST API documentation at https://github.com/ollama/ollama/blob/main/docs/api.md"


ollama-pull:
ifdef model
	@echo "> Pulling Ollama model $(model)..."
	@docker exec -it ollama ollama pull $(model) &> /dev/null
	@echo "> Model $(model) pulled"
else
	@echo "> Please provide a model to pull."
	@echo "Example: make ollama-pull model=llama3.3"
	@echo ""
	@echo "> Check available models to pull at https://ollama.com/library"
endif


ollama-start-cli:
ifdef model
	@echo "> Starting Ollama model $(model) CLI in interactive mode..."
	@docker exec -it ollama ollama run $(model)

else
	@echo "> Please provide a model to start."
	@echo "Example: make ollama-start-cli model=llama3.3"
	@echo ""
	@echo "> Check available models to start at https://ollama.com/library"
endif


ollama-list-models:
	@echo "> Listing locally available models..."
	@docker exec -it ollama ollama list
	@echo ""
	@echo "> Check available models to pull at https://ollama.com/library"


ollama-reset:
	@make ollama-stop
	@make ollama-build
	@make ollama-run


ollama-stop:
	@echo "> Stopping Ollama..."
	@docker compose down &> /dev/null
	@echo "> Ollama stopped"


help:
	@echo "Docker-based Ollama setup"
	@echo ""
	@echo "Usage: make <command>"
	@echo ""
	@echo "Available commands:"
	@echo " - ollama-build ............... Build Ollama image"
	@echo " - ollama-run ................. Run Ollama container"
	@echo " - ollama-reset ............... Rebuild and restart Ollama container"
	@echo " - ollama-stop ................ Stop Ollama container"
	@echo " - help ....................... Show this help message"