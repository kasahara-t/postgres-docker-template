#!/bin/sh

# Set the environment variables
HOST="${POSTGRES_HOST:-localhost}"
PORT="${POSTGRES_PORT:-5432}"
USER="${POSTGRES_USER:-postgres}"
PASSWORD="${POSTGRES_PASSWORD:-}"
DATABASE="${POSTGRES_DATABASE:-}"

# If the environment variables are set in a file, use them
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

# Run the migrations
migrate -path /app/histories -database $URL up