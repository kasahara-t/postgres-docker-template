# https://hub.docker.com/r/dpage/pgadmin4/
FROM dpage/pgadmin4:latest

# Temporarily switch to root user to install packages
USER root

# Install gettext for envsubst
RUN apk add --no-cache gettext

# Create a configuration file
RUN touch /pgadmin4/servers.json && \
    chown 5050:5050 /pgadmin4/servers.json

# Copy the template file
COPY servers.json.template /templates/servers.json.template

# Copy the script files
COPY --chown=5050:5050 substitute-vars.sh /substitute-vars.sh
COPY --chown=5050:5050 custom-entrypoint.sh /custom-entrypoint.sh

RUN chmod u+x /substitute-vars.sh && \
    chmod u+x /custom-entrypoint.sh

# Switch back to the pgadmin user
USER 5050

ENTRYPOINT ["sh", "/custom-entrypoint.sh"]
