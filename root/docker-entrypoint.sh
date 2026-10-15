#!/bin/sh

mkdir -p /run/haproxy

if [ "${DISABLE_IPV6}" = 1 ]; then
    BIND_PROTO=":2375"
else
    BIND_PROTO="[::]:2375 v4v6"
fi

sed -e "s/@@BIND_PROTO@@/${BIND_PROTO}/g" \
    -e "s/@@TIMEOUT_CLIENT@@/${TIMEOUT_CLIENT:-10}m/g" \
    -e "s/@@TIMEOUT_SERVER@@/${TIMEOUT_SERVER:-10}m/g" \
    /templates/haproxy.cfg > /run/haproxy/haproxy.cfg

echo '
───────────────────────────────────────

      ██╗     ███████╗██╗ ██████╗
      ██║     ██╔════╝██║██╔═══██╗
      ██║     ███████╗██║██║   ██║
      ██║     ╚════██║██║██║   ██║
      ███████╗███████║██║╚██████╔╝
      ╚══════╝╚══════╝╚═╝ ╚═════╝

    Brought to you by linuxserver.io
───────────────────────────────────────
───────────────────────────────────────

To support LSIO projects visit:
https://www.linuxserver.io/donate/

───────────────────────────────────────'
if [ -f /build_version ]; then
    cat /build_version
    echo '
───────────────────────────────────────
    '
fi

echo "[ls.io-init] done."

exec /usr/sbin/haproxy -f /run/haproxy/haproxy.cfg -W -db
