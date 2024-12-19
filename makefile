
ifneq ("$(wildcard .env)","")
    include .env
    export
endif
MIGRATIONS_DIR = migrations

up:
	goose -dir ${MIGRATIONS_DIR} postgres ${DATABASE_URL} up

down:
	goose -dir ${MIGRATIONS_DIR} postgres ${DATABASE_URL} down

new:
	goose -dir ${MIGRATIONS_DIR} create $(name) sql

run:
	go run cmd/main.go