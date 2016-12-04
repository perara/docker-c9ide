FROM ubuntu:xenial
MAINTAINER Per-Arne Andersen <per@sysx.no>

# Use a script to configure the container. This way we can
# split up the operations and do it all in a single layer.
ADD run_container.sh /tmp/
RUN /tmp/run_container.sh

# RUN mkdir -p /workspace # Created in run_container.sh
VOLUME /workspace
WORKDIR /workspace
#RUN chmod 777 /workspace

EXPOSE 8181

ENV USERNAME ""
ENV PASSWORD ""
ENV HTPASSWD ""

ADD run_usercommand.sh /tmp/

USER user
CMD ["/tmp/run_usercommand.sh"]
