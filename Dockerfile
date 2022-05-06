FROM couchdb
WORKDIR /opt/couchdb/etc
COPY generate-certificate.sh /opt/couchdb/etc/generate-certificate.sh
RUN /bin/sh generate-certificate.sh