#!/bin/bash
ip=$(curl -s https://icanhazip.com)

# only works with mullvad, adjust as needed
mullvad status | grep "Connected" &>/dev/null \
&& jq -c -n --arg ip "$ip" '{"text":$ip,"class":"connected","percentage":100}' \
|| echo '{"text":"VPN Disconnected","class":"disconnected","percentage":0}'
