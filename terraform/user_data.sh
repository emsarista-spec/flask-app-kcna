#!/bin/bash
sudo apt update -y
sudo apt install -y apache2 openssl

sudo systemctl start apache2
sudo systemctl enable apache2

sudo bash -c "echo your very first server > /var/www/html/index.html"

# Enable SSL module
sudo a2enmod ssl

# Generate self-signed certificate
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout /etc/ssl/private/apache-selfsigned.key \
  -out /etc/ssl/certs/apache-selfsigned.crt \
  -subj "/C=US/ST=State/L=City/O=Org/CN=localhost"

# Configure SSL virtual host
sudo tee /etc/apache2/sites-available/default-ssl.conf > /dev/null <<SSLCONF
<VirtualHost *:443>
  ServerName localhost
  DocumentRoot /var/www/html
  SSLEngine on
  SSLCertificateFile /etc/ssl/certs/apache-selfsigned.crt
  SSLCertificateKeyFile /etc/ssl/private/apache-selfsigned.key
</VirtualHost>
SSLCONF

sudo a2ensite default-ssl
sudo systemctl restart apache2
