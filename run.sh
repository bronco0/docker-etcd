#!/bin/sh
# Check for $ETCD_NODE
if [ -z ${ETCD_NODE} ]; then
        echo "ETCD_NODE not defined"
        exit 1
fi

ETCD_CMD="/bin/etcd \
  --data-dir=/data \
  --name etcd-node-2 \
  --initial-advertise-peer-urls http://k3s-server-${ETCD_NODE}.lan:2380 \
  --listen-peer-urls http://k3s-server-${ETCD_NODE}.lan:2380 \
  --listen-client-urls http://k3s-server-${ETCD_NODE}.lan:2379,http://127.0.0.1:2379 \
  --advertise-client-urls http://k3s-server-${ETCD_NODE}.lan:2379 \
  --initial-cluster-token etcd-cluster-1 \
  --initial-cluster etcd-node-1=http://k3s-server-1.lan:2380,etcd-node-2=http:///k3s-server-2.lan:2380,etcd-node-3=http:///k3s-server-3.lan:2380 \
  --initial-cluster-state new
  $*"
echo -e "Running '$ETCD_CMD'\nBEGIN ETCD OUTPUT\n"

exec $ETCD_CMD
