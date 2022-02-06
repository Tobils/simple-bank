postgres:
	docker-compose -f ./devcontainer/docker-compose.yml up -d

createdb: 
	docker exec -it simple-bank-db createdb --username=suhada --owner=suhada simple_bank

dropdb: 
	docker exec -it simple-bank-db dropdb simple_bank --username=suhada

migrateup:
	migrate -path db/migrations -database "postgresql://suhada:secret@localhost:5432/simple_bank?sslmode=disable" -verbose up 

migratedown:
	migrate -path db/migrations -database "postgresql://suhada:secret@localhost:5432/simple_bank?sslmode=disable" -verbose down

sqlc:
	sqlc generate

.PHONY: postgres createdb dropdb migrateup migratedown sqlc