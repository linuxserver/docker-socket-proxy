#!/bin/bash

if [[ $POST == 1 ]]; then
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

───────────────────────────────────────
'

echo "[ls.io-init] done."

exec /usr/sbin/nginx -e stderr
