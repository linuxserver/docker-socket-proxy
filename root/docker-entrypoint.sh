#!/bin/bash

if [[ $POST == 1 ]] && [[ $DISABLE_IPV6 == 1 ]]; then
    envsubst "$(printf '${%s} ' $(bash -c "compgen -A variable"))" < /templates/default_post_ipv4.template > /run/default.conf
elif [[ $POST == 0 ]] && [[ $DISABLE_IPV6 == 1 ]]; then
    envsubst "$(printf '${%s} ' $(bash -c "compgen -A variable"))" < /templates/default_nopost_ipv4.template > /run/default.conf
elif [[ $POST == 1 ]]; then
    envsubst "$(printf '${%s} ' $(bash -c "compgen -A variable"))" < /templates/default_post.template > /run/default.conf
else
    envsubst "$(printf '${%s} ' $(bash -c "compgen -A variable"))" < /templates/default_nopost.template > /run/default.conf
fi

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
if [[ -f /build_version ]]; then
    cat /build_version
    echo '
───────────────────────────────────────
    '
fi

echo "[ls.io-init] done."

exec /usr/sbin/nginx -e stderr
