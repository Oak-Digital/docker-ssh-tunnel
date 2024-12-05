FROM alpine:latest
RUN apk add --no-cache openssh
RUN apk add --no-cache sshpass

RUN mkdir /var/.ssh
RUN touch /var/.ssh/known_hosts

VOLUME /var/ssh

COPY entry.sh /usr/bin/entry

RUN chmod +x /usr/bin/entry
ARG KEYFILE_LOCATION=/var/ssh/privatekey

ENV KEYFILE_LOCATION=$KEYFILE_LOCATION
ENV ALIVE_INTERVAL=60
ENV REMOTE_PORT=22
ENV LOCAL_PORT=3306
ENV REMOTE_USER=root
ENV REMOTE_TARGET_PORT=3306

CMD ["/usr/bin/entry"]
