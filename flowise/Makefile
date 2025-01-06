FLOWISE_CPU = 0.5
FLOWISE_MEMORY = 1024m
FLOWISE_HOST_PORT = 3000
FLOWISE_USERNAME = admin
FLOWISE_PASSWORD = admin
DEVELOPER_DIR = ~/Developer

ai-builder-clone:
	@echo "> Cloning AI Builder..."
	@cd ${DEVELOPER_DIR} && git clone https://github.com/StartSe/ai-builder.git
	@echo "> AI Builder cloned"


ai-builder-build:
	@if [ ! -d ${DEVELOPER_DIR}/ai-builder ]; then \
		make ai-builder-clone; \
	fi

	@echo "> Building AI Builder..."
	@docker image rm -f ai-builder &> /dev/null || true
	@cd ${DEVELOPER_DIR}/ai-builder/ && docker build --no-cache -t ai-builder .
	@echo "> AI Builder image built"


ai-builder-run:
	@echo "> Starting AI Builder..."
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
	@@HOST_PORT=${FLOWISE_HOST_PORT} \
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
	@echo " - ai-builder-clone .......... Clone AI Builder repository"
	@echo " - ai-builder-build .......... Build AI Builder image"
	@echo " - ai-builder-run ............ Run AI Builder container"
	@echo " - ai-builder-reset .......... Rebuild and restart AI Builder container"
	@echo " - ai-builder-stop ........... Stop AI Builder container"
	@echo ""
	@echo " - help ...................... Show this help message"