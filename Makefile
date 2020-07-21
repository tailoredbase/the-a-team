BUILD_DIR:=build
SERVICE_NAME:=the-a-team

lint: ## Run static analysis
	golangci-lint run -E goimports

test: ## Run tests
	go test -race -short ./...

build: ## Build the binary file
	go build -o ${BUILD_DIR}/${SERVICE_NAME}

up: ## Start service
	docker-compose up --build

down: ## Stop service and remove temporary files
	docker-compose down
	rm -rf ${BUILD_DIR}/

help: ## Display the help screen
	@grep -h -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}'

.PHONY: lint test build help 