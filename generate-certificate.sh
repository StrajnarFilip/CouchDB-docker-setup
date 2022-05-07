#!/bin/sh
cd /opt/couchdb/etc
echo ' [ req ]
 default_bits           = 4096
 default_keyfile        = private-key.pem
 distinguished_name     = req_distinguished_name
 attributes             = req_attributes
 prompt                 = no
 output_password        = selfsigned

 [ req_distinguished_name ]
 C                      = GB
 ST                     = Self signed
 L                      = Self signed
 O                      = Self signed
 OU                     = Self signed
 CN                     = Self signed
 emailAddress           = self@signed.com

 [ req_attributes ]
 challengePassword              = A challenge password' > config.file

openssl req -x509 -days 100000 -out certificate.pem -config config.file

echo '[ssl]
enable = true
cert_file = /opt/couchdb/etc/certificate.pem
key_file = /opt/couchdb/etc/private-key.pem
password = selfsigned' > ./local.d/ssl.ini