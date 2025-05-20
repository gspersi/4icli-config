FROM ubuntu:22.04

# Install dependencies
RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y wine64 wine32 wget unzip

# Set working directory
WORKDIR /opt/4icli

# Copy the executable and script
COPY 4icli.exe .
COPY configure.sh .

# Make script executable
RUN chmod +x configure.sh

# Set entrypoint
# ENTRYPOINT ["./configure.sh"]
