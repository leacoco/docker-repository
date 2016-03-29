FROM devsoftcom/busybox

COPY run.sh /usr/local/bin/
##CMD ["/usr/local/bin/run.sh"]

VOLUME ["/data", "/var/softcom"]

ENV FIRSTNAME Leacoco
ENV SECONDNAME Nobody
ADD bar /bar
WORKDIR /bar
ENTRYPOINT ["top", "-b"]
CMD ["-c"]
