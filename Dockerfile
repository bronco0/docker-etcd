FROM        alpine:3.11
ARG         ETCD_VERSION=3.4.4-r0
RUN         echo http://dl-cdn.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories \
            && apk --no-cache --no-progress add etcd=$ETCD_VERSION
VOLUME      /data
EXPOSE      2379 2380 4001 7001
COPY        run.sh /bin/run.sh
ENTRYPOINT  ["/bin/run.sh"]
