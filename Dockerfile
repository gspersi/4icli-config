FROM ubuntu:22.04

# Install any dependencies your Linux binary needs (adjust as needed)
RUN apt-get update && \
    apt-get install -y curl unzip && \
    apt-get clean

# Set working directory
WORKDIR /opt/4icli

# Copy the Linux binary and script
COPY 4icli .
COPY configure.sh .

# Make them executable
RUN chmod +x 4icli configure.sh

# Set entrypoint to your script
ENTRYPOINT ["./configure.sh"]

