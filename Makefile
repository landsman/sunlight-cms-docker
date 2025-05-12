.PHONY: build up down restart logs shell clean help remove-install start-over

# Default target
.DEFAULT_GOAL := help

# Variables
DOCKER_COMPOSE = docker-compose
CONTAINER_WEB = web

# Colors
COLOR_RESET = \033[0m
COLOR_BOLD = \033[1m
COLOR_GREEN = \033[32m
COLOR_YELLOW = \033[33m

# Help command
help: ## Show this help
	@echo "$(COLOR_BOLD)Sunlight CMS Docker Makefile$(COLOR_RESET)"
	@echo "$(COLOR_BOLD)Usage:$(COLOR_RESET) make [target]"
	@echo ""
	@echo "$(COLOR_BOLD)Available targets:$(COLOR_RESET)"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  $(COLOR_GREEN)%-15s$(COLOR_RESET) %s\n", $$1, $$2}'

# Build the Docker images
build: ## Build the Docker images
	@echo "$(COLOR_BOLD)Building Docker images...$(COLOR_RESET)"
	$(DOCKER_COMPOSE) build

# Start the containers
up: ## Start the containers
	@echo "$(COLOR_BOLD)Starting containers...$(COLOR_RESET)"
	$(DOCKER_COMPOSE) up -d
	@echo "$(COLOR_YELLOW)Sunlight CMS is now available at http://localhost:8080$(COLOR_RESET)"

# Stop the containers
down: ## Stop the containers
	@echo "$(COLOR_BOLD)Stopping containers...$(COLOR_RESET)"
	$(DOCKER_COMPOSE) down

# Restart the containers
restart: down up ## Restart the containers

# View logs
logs: ## View container logs
	@echo "$(COLOR_BOLD)Viewing logs...$(COLOR_RESET)"
	$(DOCKER_COMPOSE) logs -f

# Enter the container shell
shell: ## Enter the web container shell
	@echo "$(COLOR_BOLD)Entering web container shell...$(COLOR_RESET)"
	$(DOCKER_COMPOSE) exec $(CONTAINER_WEB) bash

# Clean up resources
clean: ## Remove containers, volumes, and images
	@echo "$(COLOR_BOLD)Cleaning up resources...$(COLOR_RESET)"
	$(DOCKER_COMPOSE) down -v --rmi all

# Install Sunlight CMS
install: up ## Install Sunlight CMS
	@echo "$(COLOR_BOLD)Sunlight CMS is ready to be installed.$(COLOR_RESET)"
	@echo "$(COLOR_YELLOW)Please visit http://localhost:8080/install to complete the installation.$(COLOR_RESET)"
	@echo "$(COLOR_YELLOW)A pre-filled configuration has been provided with the following settings:$(COLOR_RESET)"
	@echo "  - Database server: db"
	@echo "  - Database name: sunlight"
	@echo "  - Database username: sunlight"
	@echo "  - Database password: sunlight_password"
	@echo "  - Table prefix: sunlight"

# Remove installation directory
remove-install: ## Remove the installation directory from the container
	@echo "$(COLOR_BOLD)Removing installation directory...$(COLOR_RESET)"
	$(DOCKER_COMPOSE) exec $(CONTAINER_WEB) rm -rf /var/www/html/install
	@echo "$(COLOR_YELLOW)Installation directory has been removed.$(COLOR_RESET)"

# Start over - completely reset the environment
start-over: ## Completely reset the environment and start over
	@echo "$(COLOR_BOLD)WARNING: This will remove all containers, volumes, images, and data directories.$(COLOR_RESET)"
	@echo "$(COLOR_BOLD)All your data will be lost. Make sure to back up any important data before proceeding.$(COLOR_RESET)"
	@read -p "Are you sure you want to continue? (y/n) " -n 1 -r; \
	echo ""; \
	if [[ $$REPLY =~ ^[Yy]$$ ]]; then \
		$(MAKE) clean; \
		echo "$(COLOR_BOLD)Removing data directories...$(COLOR_RESET)"; \
		rm -rf ./config ./upload ./mysql_data; \
		echo "$(COLOR_YELLOW)Environment has been reset. To start over, run:$(COLOR_RESET)"; \
		echo "$(COLOR_YELLOW)  make build$(COLOR_RESET)"; \
		echo "$(COLOR_YELLOW)  make up$(COLOR_RESET)"; \
		echo "$(COLOR_YELLOW)  make install$(COLOR_RESET)"; \
	else \
		echo "$(COLOR_YELLOW)Operation cancelled.$(COLOR_RESET)"; \
	fi
