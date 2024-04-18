#!/bin/sh

# mysql接続情報の取得
HOST="${POSTGRES_HOST:-localhost}"
PORT="${POSTGRES_PORT:-5432}"
USER="${POSTGRES_USER:-postgres}"
PASSWORD="${POSTGRES_PASSWORD:-}"
DATABASE="${POSTGRES_DATABASE:-}"

# _fileの環境変数があればそれを優先
if [ -n "$POSTGRES_USER_FILE" ] && [ -f "$POSTGRES_USER_FILE" ]; then
    USER=$(cat "$POSTGRES_USER_FILE")
fi
if [ -n "$POSTGRES_PASSWORD_FILE" ] && [ -f "$POSTGRES_PASSWORD_FILE" ]; then
    PASSWORD=$(cat "$POSTGRES_PASSWORD_FILE")
fi
if [ -n "$POSTGRES_DATABASE_FILE" ] && [ -f "$POSTGRES_DATABASE_FILE" ]; then
    DATABASE=$(cat "$POSTGRES_DATABASE_FILE")
fi

URL="postgres://${USER}:${PASSWORD}@${HOST}:${PORT}/${DATABASE}?sslmode=disable"

# マイグレーションの実行
migrate -path /app/histories -database $URL up