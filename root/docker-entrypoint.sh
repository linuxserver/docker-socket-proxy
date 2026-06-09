#!/bin/sh

mkdir -p /run/haproxy

PORT=${SOCKET_PROXY_PORT:-2375}

if [ "${DISABLE_IPV6}" = 1 ]; then
    BIND_PROTO=":${PORT}"
else
    BIND_PROTO="[::]:${PORT} v4v6"
fi

sed "s/@@BIND_PROTO@@/${BIND_PROTO}/g" /templates/haproxy.cfg > /run/haproxy/haproxy.cfg

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
