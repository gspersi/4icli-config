#!/bin/bash

# Use environment variables
echo -e "${CLIENT_ID}\n${CLIENT_SECRET}" | wine 4icli.exe configure

# Check if config.txt was created
if [ -f config.txt ]; then
    echo "Configuration successful."
else
    echo "Configuration failed."
    exit 1
fi
