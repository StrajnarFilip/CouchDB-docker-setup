FROM couchdb
WORKDIR /opt/couchdb/etc
COPY ssl-entrypoint.sh /ssl-entrypoint.sh
ENTRYPOINT [ "/bin/sh" , "/ssl-entrypoint.sh" ]
CMD [ "/bin/sh" , "/ssl-entrypoint.sh" ]