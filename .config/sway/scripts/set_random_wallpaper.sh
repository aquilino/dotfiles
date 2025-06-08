#!/bin/bash

# Directorio que contiene las imágenes de fondo de pantalla
WALLPAPER_DIR="/home/h1dr0/wallpapers"

# Esperar un momento para asegurarse de que swaybg se haya terminado
sleep 1

# Seleccionar una imagen aleatoria del directorio
WALLPAPER=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)

# Matar cualquier instancia existente de swaybg
pkill swaybg

# Configurar la imagen seleccionada como fondo de pantalla
swaybg -i "$WALLPAPER" &
