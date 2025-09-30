#!/bin/bash
ip=$(curl -s https://icanhazip.com)

ls /proc/sys/net/ipv4/conf/*mullvad* &>/dev/null \ # only works with mullvad vpn, adjust as needed
&& jq -c -n --arg ip "$ip" '{"text":$ip,"class":"connected","percentage":100}' \
|| echo '{"text":"VPN Disconnected","class":"disconnected","percentage":0}'
