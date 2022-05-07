#!/bin/sh
cp /opt/couchdb/etc/certificate.pem /cert/certificate.pem
cp /opt/couchdb/etc/private-key.pem /cert/private-key.pem
tini -- "/docker-entrypoint.sh" "/opt/couchdb/bin/couchdb"