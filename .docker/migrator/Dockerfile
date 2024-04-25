# Changed comments from Japanese to English
FROM golang:1.22-alpine

WORKDIR /app

# Install required packages
RUN go install -tags 'postgres' github.com/golang-migrate/migrate/v4/cmd/migrate@latest

# Copy the migration files and the script
COPY ./histories /app/histories
COPY ./migrate.sh /app/migrate.sh
RUN chmod +x /app/migrate.sh

# Create a non-root user and switch to it
RUN adduser -D nonrootuser
USER nonrootuser

CMD ["sh", "migrate.sh"]
