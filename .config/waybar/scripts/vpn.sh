#!/usr/bin/env bash

vpn_ip=
connected=false
sleep 0.2s

if ! mullvad status | grep -q "Connect"; then
  echo '{"text":"VPN Disconnected","class":"disconnected","percentage":0}'
  exit
fi

for i in {1..100}; do
  if mullvad status | grep -q "Connected"; then
    connected=true
    break 1
  fi
  sleep 0.1s
  continue
done

if ! $connected; then
  echo '{"text":"VPN Disconnected","class":"disconnected","percentage":0}'
  exit
fi

vpn_ip=$(curl -s4 ipinfo.io | jq -r '"\(.ip) \(.country)"')
if [[ -n "$vpn_ip" ]]; then
  jq -c -n --arg ip "$vpn_ip" '{"text":$ip,"class":"connected","percentage":100}'
fi
