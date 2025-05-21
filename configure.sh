#!/bin/bash

# Use environment variables
echo -e "${CLIENT_ID}\n${CLIENT_SECRET}" | ./4icli configure

# Check if config.txt was created
if [ -f config.txt ]; then
    echo "Configuration successful."
else
    echo "Configuration failed."
    exit 1
fi

