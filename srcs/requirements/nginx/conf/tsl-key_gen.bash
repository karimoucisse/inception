#!/bin/bash

admin_name="admin_name"
domain_name="domain_name"

openssl req -x509 -nodes -days 365 -subj \
		"/C=MO/ST=KH/L=KH/O=42/OU=42/CN=$domain_name.fr/UID=$admin_name" \
		-newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key \
		-out /etc/ssl/certs/nginx-selfsigned.crt;
		# -addext "subjectAltName=DNS:mydomain.com"

