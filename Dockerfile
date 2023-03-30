FROM alpine:latest
ENV HOME=/root
ARG KEYFILE_LOCATION=$HOME/.ssh/privatekey
ENV KEYFILE_LOCATION=$KEYFILE_LOCATION

ENV ALIVE_INTERVAL=60
ENV REMOTE_PORT=22
ENV LOCAL_PORT=3306

RUN apk add --no-cache openssh

RUN mkdir ${HOME}/.ssh
RUN touch ${HOME}/.ssh/known_hosts
COPY privatekey ${HOME}/.ssh/privatekey

COPY entry.sh /usr/bin/entry
RUN chmod +x /usr/bin/entry
CMD ["/usr/bin/entry"]
