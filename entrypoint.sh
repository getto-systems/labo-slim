#!/bin/bash

: ${LABO_USER:=labo}

useradd $LABO_USER -s /bin/zsh && \
  usermod -aG sudo $LABO_USER

if [ -n "$LABO_TIMEZONE" ]; then
  if [ -f "/usr/share/zoneinfo/$LABO_TIMEZONE" ]; then
    ln -sf /usr/share/zoneinfo/$LABO_TIMEZONE /etc/localtime
  fi
fi

exec sudo -E -H -u $LABO_USER "$@"
