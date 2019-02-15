FROM nginx:alpine

LABEL Organization="CTFTraining" Author="Virink <virink@outlook.com>"

MAINTAINER Virink@CTFTraining <virink@outlook.com>

COPY src /var/www/html

COPY _file /tmp/

RUN mv /tmp/flag.sh /flag.sh \
    && mv /tmp/docker-entrypoint /usr/local/bin/docker-entrypoint \
    && chmod +x /usr/local/bin/docker-entrypoint \
    && mv /tmp/nginx.conf /etc/nginx/nginx.conf

WORKDIR /var/www/html

CMD ["/bin/sh", "-c", "docker-entrypoint"]

EXPOSE 80
