FROM ubuntu:22.04

# Install dependencies
RUN apt-get update && \
    apt-get install -y build-essential curl git unzip \
    libssl-dev zlib1g-dev libffi-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*


# Set working directory
WORKDIR /opt

# Download and build OpenSSL 3.0.13 with provider support
RUN curl -O https://www.openssl.org/source/openssl-3.0.13.tar.gz && \
    tar -xzf openssl-3.0.13.tar.gz && \
    cd openssl-3.0.13 && \
    ./Configure --prefix=/usr/local/openssl --openssldir=/usr/local/openssl shared enable-fips && \
    make -j$(nproc) && \
    make install

# Set environment variables to use the custom OpenSSL
ENV PATH="/usr/local/openssl/bin:$PATH"
ENV LD_LIBRARY_PATH="/usr/local/openssl/lib:$LD_LIBRARY_PATH"
ENV OPENSSL_CONF="/usr/local/openssl/ssl/openssl.cnf"

# Verify OpenSSL installation
RUN openssl version -a && openssl list -providers

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


