OUT_DIR=bin
NAME=app

build:
	@go build -o $(OUT_DIR)/$(NAME) cmd/$(NAME)
