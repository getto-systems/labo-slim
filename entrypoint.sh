#!/bin/sh

: ${LABO_USER:=labo}

adduser -S $LABO_USER && \
  addgroup $LABO_USER && \
  usermod -g $LABO_USER -G $LABO_USER,sudo $LABO_USER

if [ -n "$LABO_TIMEZONE" ]; then
  ln -sf /usr/share/zoneinfo/$LABO_TIMEZONE /etc/localtime
fi

exec sudo -u $LABO_USER "$@"
