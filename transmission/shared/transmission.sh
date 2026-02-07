#!/bin/sh
# transmission.sh - QPKG service control script

DAEMON_CMD="/usr/local/bin/transmission-daemon"
CONFIG_DIR="/share/MD0_DATA/.qpkg/transmission/config"
DOWNLOAD_DIR="/share/MD0_DATA/transmission"
PIDFILE="/var/run/transmission.pid"

case "$1" in
  start)
    echo "Starting Transmission daemon..."
    $DAEMON_CMD -g "$CONFIG_DIR" -w "$DOWNLOAD_DIR" -x "$PIDFILE"
    ;;
  stop)
    echo "Stopping Transmission daemon..."
    if [ -f "$PIDFILE" ]; then
      kill $(cat "$PIDFILE")
      rm -f "$PIDFILE"
    fi
    ;;
  restart)
    $0 stop
    $0 start
    ;;
  remove)
    $0 stop
    # Clean up on package removal
    rm -rf "$CONFIG_DIR"
    ;;
  *)
    echo "Usage: $0 {start|stop|restart|remove}"
    exit 1
esac
