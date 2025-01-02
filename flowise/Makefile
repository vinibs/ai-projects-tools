FLOWISE_CPU = 0.5
FLOWISE_MEMORY = 1024m
FLOWISE_HOST_PORT = 3000
DEVELOPER_DIR = ~/Developer

flowise-clone:
	@echo "> Cloning Flowise (AI Builder)..."
	@cd ${DEVELOPER_DIR} && git clone https://github.com/StartSe/ai-builder.git
	@echo "> Flowise cloned"


flowise-build:
	@if [ ! -d ${DEVELOPER_DIR}/ai-builder ]; then \
		make flowise-clone; \
	fi

	@echo "> Building Flowise..."
	@docker image rm -f ai-builder &> /dev/null || true
	@cd ${DEVELOPER_DIR}/ai-builder/ && docker build --no-cache -t ai-builder .
	@echo "> Flowise image built"


flowise-run:
	@echo "> Starting Flowise..."
	@docker run -dit \
		--name ai-builder \
		--cpus $(FLOWISE_CPU) \
		--rm \
		-m $(FLOWISE_MEMORY) \
		-p ${FLOWISE_HOST_PORT}:3000 \
		-e DEBUG=true \
		-e LOG_LEVEL=debug \
		-e DATABASE_PATH=/root/.flowise \
		-e APIKEY_PATH=/root/.flowise \
		-e SECRETKEY_PATH=/root/.flowise \
		-e LOG_PATH=/root/.flowise/logs \
		-e BLOB_STORAGE_PATH=/root/.flowise/storage \
		-v ~/.flowise:/root/.flowise \
		ai-builder &> /dev/null

	@sleep 45
	@echo "> Flowise is running on http://localhost:${FLOWISE_HOST_PORT}"


flowise-reset:
	@make flowise-stop
	@make flowise-build
	@make flowise-run


flowise-stop:
	@echo "> Stopping Flowise..."
	@docker stop ai-builder &> /dev/null || true
	@docker rm ai-builder &> /dev/null || true
	@echo "> Flowise stopped"


help:
	@echo "Docker-based Flowise (AI Builder) setup"
	@echo ""
	@echo "Usage: make <command>"
	@echo ""
	@echo "Available commands:"
	@echo " - flowise-clone .......... Clone Flowise repository"
	@echo " - flowise-build .......... Build Flowise image"
	@echo " - flowise-run ............ Run Flowise container"
	@echo " - flowise-reset .......... Rebuild and restart Flowise container"
	@echo " - flowise-stop ........... Stop Flowise container"
	@echo " - help ................... Show this help message"