FROM ubuntu:16.04
MAINTAINER Silent Infotech <admin@silentinfotech.com>

ENV DOMAIN_NAME odoo-dev.mbee.co
ENV EMAIL admin@mbee.co

RUN apt-get update
RUN apt-get install -y \
	letsencrypt
RUN mkdir -p /etc/letsencrypt/haproxy/certs
VOLUME ["/etc/letsencrypt/haproxy/certs","/etc/letsencrypt"]
EXPOSE 80 443
CMD ["/bin/bash"]
COPY ./entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
