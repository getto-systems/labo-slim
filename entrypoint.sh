#!/bin/bash

: ${LABO_USER:=labo}

adduser -D $LABO_USER && \
  usermod -g $LABO_USER -G $LABO_USER,sudo -s /bin/zsh $LABO_USER

if [ -n "$LABO_TIMEZONE" ]; then
  if [ -f "/usr/share/zoneinfo/$LABO_TIMEZONE" ]; then
    ln -sf /usr/share/zoneinfo/$LABO_TIMEZONE /etc/localtime
  fi
fi

exec sudo -E -H -u $LABO_USER "$@"
