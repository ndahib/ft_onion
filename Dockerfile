FROM debian:bullseye-slim

RUN apt update && \
    apt install nginx tor openssh-server -y

COPY ./config/nginx.conf /etc/nginx/nginx.conf
COPY ./config/server.conf /etc/nginx/conf.d/

COPY ./config/torrc /etc/tor/torrc

RUN mkdir -p /var/lib/tor/hidden_service \
    && chown -R debian-tor:debian-tor /var/lib/tor


COPY index.html /var/www/html
EXPOSE 80

COPY script.sh /start.sh
RUN chmod +x /start.sh
RUN chown -R debian-tor:debian-tor /var/lib/tor

CMD ["/start.sh"]