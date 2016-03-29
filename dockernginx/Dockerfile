# FROM devsoftcom/testcentos
FROM smebberson/alpine-base:1.2.0
MAINTAINER Leadel Ngalame

# RUN yum install -y epel-release
# RUN yum install  -y nginx
# RUN mkdir -p /tmp/nginx/client-body

# COPY nginx-conf/nginx.conf /etc/nginx/nginx.conf
# COPY nginx-conf/default.conf /etc/nginx/config.d/default.conf

# COPY website-files /usr/share/nginx/html

# EXPOSE 80

# CMD ["nginx", "-g", "daemon off;"]

# Install nginx
RUN apk add --update nginx=1.8.0-r1 && \
    rm -rf /var/cache/apk/* && \
    chown -R nginx:www-data /var/lib/nginx

# Add the files
COPY nginx-conf/nginx.conf /etc/nginx/nginx.conf
COPY nginx-conf/default.conf /etc/nginx/config.d/default.conf
COPY website-files /usr/share/nginx/html

# Expose the ports for nginx
EXPOSE 80 443