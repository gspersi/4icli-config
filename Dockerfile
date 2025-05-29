FROM ubuntu:22.04

# Install dependencies
RUN apt-get update && \
    apt-get install -y build-essential curl git unzip \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /opt/4icli

# Copy the Linux zip file into the container
COPY 4icli-linux-x64-v0.0.20.zip .

# Optional: expose a volume to mount the shared directory
VOLUME ["/mnt/ppcc-share"]

# Copy unzipped contents to the mount point
RUN cp /opt/4icli/4icli-linux-x64-v0.0.20.zip /mnt/ppcc-share/

# Unzip the file
RUN unzip /mnt/ppcc-share/4icli-linux-x64-v0.0.20.zip -d /mnt/ppcc-share && \
    chmod +x /mnt/ppcc-share/*
    
# Set default command (optional)
CMD ["/bin/bash"]


