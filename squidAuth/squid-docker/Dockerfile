FROM reflex-docker-hub.hannover-re.com/base/ubuntu:14.04
MAINTAINER Leadel Ngome Ngalame

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 80F70E11F0F0D5F10CB20E62F5DA5F09C3173AA6 \
 && echo "deb http://ppa.launchpad.net/brightbox/squid-ssl/ubuntu trusty main" >> /etc/apt/sources.list \
 && apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y squid3-ssl=${SQUID_VERSION}* \
 && mv /etc/squid3/squid.conf /etc/squid3/squid.conf.dist \
 && rm -rf /var/lib/apt/lists/*

# Set the Squid environment variables for use in the Container
ENV SQUID_VERSION=3.3.8 \
    SQUID_CACHE_DIR=/var/spool/squid3 \
    SQUID_LOG_DIR=/var/log/squid3 \
    SQUID_USERNAME=reflex \
    SQUID_PASSWORD=reflex

# Add the Squid configuration file to the Image
ADD squid.conf /etc/squid3/squid.conf
# If you are prone to gouging your eyes out, do not read the following 2 lines
RUN sed -i 's@#\tauth_param basic program /usr/lib/squid3/basic_ncsa_auth /usr/etc/passwd@auth_param basic program /usr/lib/squid3/basic_ncsa_auth /usr/etc/passwd\nacl ncsa_users proxy_auth REQUIRED@' /etc/squid3/squid.conf
RUN sed -i 's@^http_access allow localhost$@\0\nhttp_access allow ncsa_users@' /etc/squid3/squid.conf


RUN mkdir /usr/etc

EXPOSE 3128/tcp
VOLUME ["${SQUID_CACHE_DIR}", "${SQUID_LOG_DIR}"]

ADD init /init
CMD ["/init"]
