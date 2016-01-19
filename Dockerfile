FROM hypriot/rpi-alpine-scratch

COPY gosu /usr/local/bin/gosu # GFW

RUN apk update && apk add postgresql && \
    mkdir /docker-entrypoint-initdb.d && \
    chmod +x /usr/local/bin/gosu && \
    rm -rf /var/cache/apk/*

ENV LANG en_US.utf8
ENV PGDATA /var/lib/postgresql/data
VOLUME /var/lib/postgresql/data

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 5432
CMD ["postgres"]
