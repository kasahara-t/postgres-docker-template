#!/bin/sh

sed -e "s/\${POSTGRES_HOST}/${POSTGRES_HOST}/g" \
    -e "s/\${POSTGRES_PORT}/${POSTGRES_PORT}/g" \
    -e "s/\${POSTGRES_DB}/$(cat /run/secrets/postgres_database)/g" \
    -e "s/\${POSTGRES_USER}/$(cat /run/secrets/postgres_user)/g" \
    -e "s/\${POSTGRES_PASSWORD}/$(cat /run/secrets/postgres_password)/g" \
    /templates/servers.json.template > /pgadmin4/servers.json
