-- name: CreateAccount :one
INSERT INTO accounts (owner, balance, currency)
VALUES ($1, $2, $3) RETURNING *;

-- name: GetAccount :one
SELECT *
FROM accounts
WHERE id = $1 LIMIT 1;

-- name: GetAccountForUpdate :one
SELECT *
FROM accounts
WHERE id = $1 LIMIT 1
FOR NO KEY UPDATE;

-- name: ListAccount :many
SELECT *
FROM accounts
ORDER BY id
limit $1
OFFSET $2;

-- name: UpdateAccount :exec
UPDATE accounts
set balance = $2
WHERE id = $1;

-- name: UpdateAccountBalance :exec
UPDATE accounts
set balance = balance + sqlc.arg(amount)
WHERE id = sqlc.arg(id);

-- name: DeleteAccount :exec
DELETE FROM accounts
WHERE id = $1;