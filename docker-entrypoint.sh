#!/bin/bash
set -e

if [ $# -eq 0 ]; then
    /usr/sbin/grafana-server --homepath=/usr/share/grafana --config=/etc/grafana/grafana.ini cfg:default.paths.data=/var/lib/grafana cfg:default.paths.logs=/var/log/grafana
else
    service grafana-server start
    exec "$@"
fi
