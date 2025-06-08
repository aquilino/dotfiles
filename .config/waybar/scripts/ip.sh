#!/bin/bash

# Obtener interfaz Wi-Fi (suele empezar por wl)
IFACE=$(iw dev | awk '$1=="Interface"{print $2}' | head -n 1)

# Obtener señal (QUALITY: 0–100)
QUALITY=$(awk '/'"$IFACE"':/ { print int($3 * 100 / 70) }' /proc/net/wireless 2>/dev/null)

# Obtener ESSID (nombre de red)
ESSID=$(iw dev "$IFACE" link | awk -F ': ' '/SSID/ {print $2}')

# Obtener IP v4
IP=$(ip -4 addr show "$IFACE" | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | head -n 1)

# Asegurar que todos los datos existan
if [ -z "$QUALITY" ]; then
  QUALITY=0
fi

if [ -z "$ESSID" ]; then
  ESSID="No conectado"
fi

if [ -z "$IP" ]; then
  IP="Sin IP"
fi

# Salida JSON para Waybar
echo "{\"text\": \"  ${QUALITY}%\", \"tooltip\": \"Red: ${ESSID}\\nIP: ${IP}\"}"