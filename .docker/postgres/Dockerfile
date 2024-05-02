# https://www.pgadmin.org/docs/pgadmin4/latest/container_deployment.html
FROM postgres:latest

# Receive language as an argument
# Default is en_US
ARG DB_LANG=en_US
RUN localedef -i $DB_LANG -c -f UTF-8 -A /usr/share/locale/locale.alias $DB_LANG.UTF-8
ENV LANG $DB_LANG.utf8

# Copy the initial SQL file for database setup
COPY ./initdb.d/ /docker-entrypoint-initdb.d/