FROM couchdb
WORKDIR /opt/couchdb/etc
COPY generate-certificate.sh /opt/couchdb/etc/generate-certificate.sh
COPY ssl-entrypoint.sh /ssl-entrypoint.sh
ENTRYPOINT [ "/bin/sh" , "/ssl-entrypoint.sh" ]
CMD [ "/bin/sh" , "/ssl-entrypoint.sh" ]