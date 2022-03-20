### Alpine Privoxy

This privoxy server redirect request to another proxy, based on the URL :
  - request on xxx.i2p redirect to I2P proxy (if environment variables I2P_* set)
  - request on xxx.onion redirect to TOR proxy (if environment variables TOR_* set)
  - remaining request redirect to SOCKS5 proxy (if environment variables SOCKS5_* set), or directly 

## Usage

Environment Variables (Optional)

| Variable     | Usage                                                  |
| ------------ | ------------------------------------------------------ |
| SOCKS5_IP    | The ip/name of the default socks5 server               |
| SOCKS5_PORT  | the port of the default socks5 server                  |
| I2P_IP       | the ip/name of the i2p http proxy, for .i2p URL        |
| I2P_PORT     | the port of the i2p http proxy, for .i2p URL           |
| TOR_IP       | the ip/name of the tor socks5 proxy, for .onion URL    |
| TOR_PORT     | the port of the tor socks5 proxy, for .onion URL       |

Privoxy listens to 8118

Sample command
```bash
docker run -d -p 8118:8118 -e I2P_IP=192.168.1.112  -e I2P_PORT=4444 -e TOR_IP=192.168.1.112  -e TOR_PORT=9050 yannickt/alpine-privoxy
```
