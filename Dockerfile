FROM photoboothnginx-base

COPY install-photo-booth-nginx.sh /tmp/install-photo-booth-nginx.sh

EXPOSE 80

CMD ["/tmp/install-photo-booth-nginx.sh"]

STOPSIGNAL SIGTERM
