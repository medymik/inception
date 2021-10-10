up:
	cd srcs && docker-compose up

detach:
	docker-compose up -d

down:
	cd srcs && docker-compose down

build:
	cd srcs && docker-compose build