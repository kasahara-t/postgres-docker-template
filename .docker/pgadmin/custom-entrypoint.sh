#!/bin/sh

# Substitute environment variables in the template files
/substitute-vars.sh

# Run the original entrypoint script
/entrypoint.sh