#!/bin/bash

# Obtener la IP de la VPN. Se asume que la interfaz de la VPN es tun0.
vpn_ip=$(ip addr show wlan0 2>/dev/null | grep -oP '(?<=inet\s)\d+(\.\d+){3}')

if [ $? -ne 0 ]; then
    # Capturar el error del comando 'ip addr show'
    printf "No VPN"
else
    # Se encontró la IP
    echo "$vpn_ip"
fi
