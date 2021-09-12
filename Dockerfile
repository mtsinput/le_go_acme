FROM goacme/lego:latest
LABEL org.opencontainers.image.authors="wdmaster@gmail.com"

# Automate obtain certificate with specified restart interval

# We set some defaults for config creation. Can be overwritten at runtime.
ENV OBTAIN_PERIOD_HOURS="24"

COPY ./docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT [ "sh","/docker-entrypoint.sh" ]
