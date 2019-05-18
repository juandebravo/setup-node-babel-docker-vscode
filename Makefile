ROOT_DIR:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
NAME:=demo-es6-babel-node-vscode

build:
	@echo "Building Docker $(NAME) image..."
	@docker build -t $(NAME):latest .

debug: build
	@docker run \
			-p 3000:3000 \
			-p 9229:9229 \
			-v $(ROOT_DIR)/src:/usr/src/app/src \
			--entrypoint npm \
			$(NAME):latest \
			run start

run: build
	@docker run \
			-p 3000:3000 \
			--entrypoint npm \
			$(NAME):latest \
			run serve
