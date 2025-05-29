FROM ubuntu:22.04

# Install dependencies
RUN apt-get update && \
    apt-get install -y curl unzip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /opt/4icli

# Copy the Linux zip file into the container
COPY 4icli-linux-x64-v0.0.20.zip .

# Unzip the file
RUN unzip 4icli-linux-x64-v0.0.20.zip -d /opt/4icli && \
    chmod +x /opt/4icli/*

# Optional: expose a volume to mount the shared directory
VOLUME ["/mnt/ppcc-share"]

# Copy unzipped contents to the mount point
RUN cp -r /opt/4icli/* /mnt/ppcc-share/

# Set default command (optional)
CMD ["/bin/bash"]


