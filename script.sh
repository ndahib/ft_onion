#!/bin/bash
set -e

# Start Nginx in the background
nginx -g "daemon off;" &

# Start Tor in foreground as debian-tor
exec su -s /bin/bash debian-tor -c "tor -f /etc/tor/torrc"
