#!/usr/bin/env bash

vpn_ip=

if command -v mullvad; then 
if ! mullvad status | grep -q -e "Connecting" -e "Connected"; then
    echo '{"text":"VPN Disconnected","class":"disconnected","percentage":0}'
    exit
fi

until mullvad status | grep -q "Connected"; do
    continue
done
else

sleep 0.5s
if [ ! -d /proc/sys/net/ipv4/conf/wg0 ]; then
    echo '{"text":"VPN Disconnected","class":"disconnected","percentage":0}'
    exit
fi
fi

vpn_ip=$(curl -s4 ipinfo.io | jq -r '"\(.ip) \(.country)"')
if [[ -n "$vpn_ip" ]]; then
    jq -c -n --arg ip "$vpn_ip" '{"text":$ip,"class":"connected","percentage":100}'
fi
