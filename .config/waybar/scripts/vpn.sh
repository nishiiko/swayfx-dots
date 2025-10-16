#!/usr/bin/env bash

strip_all () {
    printf '%s\n' "${1//$2}"
}

# only works with mullvad, adjust as needed
mullvad status | grep -e "Connected" -e "Connecting" &>/dev/null \
&& ip=$(curl -s4 ipinfo.io | jq -r '"\(.ip) \(.country)"') \
&& ip=$(strip_all "$ip" "[\"]") \
&& jq -c -n --arg ip "$ip" '{"text":$ip,"class":"connected","percentage":100}' \
|| echo '{"text":"VPN Disconnected","class":"disconnected","percentage":0}'
