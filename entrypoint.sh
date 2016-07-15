#!/bin/bash
set -u

echo $DOMAIN_NAME


if [ -d "/etc/letsencrypt/live/$DOMAIN_NAME/" ]; then
	echo "SSL Certificate is already issued. Certificate will be renewed"
	letsencrypt renew  --email $EMAIL --agree-tos --rsa-key-size 4096 --force
else 
	letsencrypt certonly --standalone --email $EMAIL --agree-tos --rsa-key-size 4096 -d $DOMAIN_NAME --force
fi

cat etc/letsencrypt/live/$DOMAIN_NAME/cert.pem /etc/letsencrypt/live/$DOMAIN_NAME/privkey.pem > /etc/letsencrypt/haproxy/certs/cert.pem
