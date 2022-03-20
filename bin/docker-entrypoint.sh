#!/bin/sh

sed -i "s/listen\-address  127\.0\.0\.1:8118/listen\-address  0\.0\.0\.0:8118/" /etc/privoxy/config

if [ $SOCKS5_IP ];
then
  if [ $SOCKS5_PORT ];
  then
    echo "forward-socks5t   / "$SOCKS5_IP":"$SOCKS5_PORT" ." >> /etc/privoxy/config
  fi
fi

if [ $TOR_IP ];
then
  if [ $TOR_PORT ];
  then
    echo "forward-socks5t  .onion "$TOR_IP":"$TOR_PORT" ." >> /etc/privoxy/config
  fi
fi

if [ $I2P_IP ];
then
  if [ $I2P_PORT ];
  then
    echo "forward  .i2p "$I2P_IP":"$I2P_PORT >> /etc/privoxy/config
  fi
fi

echo "forward   192.168.*.*/  ." >> /etc/privoxy/config
echo "forward   10.*.*.*/  ." >> /etc/privoxy/config
echo "forward   127.*.*.*/  ." >> /etc/privoxy/config

exec "$@"
