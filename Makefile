postgres:
	docker compose up -d
createdb:
	docker exec -it postgres12 createdb --username=postgres --owner=postgres simple_bank

dropdb:
	docker exec -it postgres12 dropdb --username=postgres simple_bank

migrateup:
	 migrate  --path db/migration -database "postgresql://postgres:secrect@localhost:5432/simple_bank?sslmode=disable" -verbose up

migratedown:
	migrate  --path db/migration -database "postgresql://postgres:secrect@localhost:5432/simple_bank?sslmode=disable" -verbose down

sqlc:
	sqlc generate

.PHONY: postgres createdb dropdb migrateup migratedown sqlc