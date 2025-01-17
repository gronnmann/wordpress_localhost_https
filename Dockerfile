# Use the official WordPress image
FROM wordpress:latest

# Install OpenSSL to create self-signed certificates
RUN apt-get update && apt-get install -y openssl

# Enable the SSL and rewrite Apache modules
RUN a2enmod ssl rewrite

# Create SSL directory in Apache
RUN mkdir -p /etc/apache2/ssl

# Generate a self-signed SSL certificate (valid for 365 days)
RUN openssl req -x509 -nodes -days 365 \
  -newkey rsa:2048 \
  -keyout /etc/apache2/ssl/apache.key \
  -out /etc/apache2/ssl/apache.crt \
  -subj "/C=US/ST=Local/L=Local/O=Local/OU=Dev/CN=localhost"

# Copy a custom Apache virtual host configuration to support HTTPS
COPY ./apache-ssl.conf /etc/apache2/sites-available/000-default.conf

# Expose both HTTP and HTTPS ports
EXPOSE 80 443