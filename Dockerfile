FROM ubuntu:22.04

# Install any dependencies your Linux binary needs (adjust as needed)
RUN apt-get update && \
    apt-get install -y curl unzip && \
    apt-get clean && \
	rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /opt/4icli

# Copy the Linux zip file
COPY 4icli-linux-x64-v0.0.20.zip

# Make them executable
RUN chmod +x 4icli configure.sh


