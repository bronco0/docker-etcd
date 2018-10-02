FROM        alpine:3.8
ARG         ETCD_VERSION=3.3.9-r2
RUN         echo http://dl-cdn.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories \
            && apk --no-cache --no-progress add etcd=$ETCD_VERSION
VOLUME      /data
EXPOSE      2379 2380 4001 7001
COPY        run.sh /bin/run.sh
ENTRYPOINT  ["/bin/run.sh"]
