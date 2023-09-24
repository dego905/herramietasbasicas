#!/bin/bash
# Colores para resaltar la salida
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No color
# Actualizar paquetes
echo -e "${GREEN}Actualizando paquetes...${NC}"
pkg update -y
# Instalar comandos básicos
echo -e "${RED}Instalando comandos básicos...${NC}"
pkg install -y coreutils termux-tools pkg-config
# Instalar comandos de red
echo -e "${RED}Instalando comandos de red...${NC}"
pkg install -y net-tools inetutils iproute2 nmap curl wget
# Instalar comandos de sistema
echo -e "${RED}Instalando comandos de sistema...${NC}"
pkg install -y procps util-linux findutils grep sed awk
# Instalar comandos de archivos
echo -e "${RED}Instalando comandos de archivos...${NC}"
pkg install -y tree rsync tar zip unzip
echo -e "${GREEN}La instalación de comandos ha finalizado.${NC}"

# Colores llamativos
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
CYAN='\033[1;36m'
NC='\033[0m' # No color

# Obtener la fecha y hora actual
current_datetime=$(date "+%Y-%m-%d %H:%M:%S")

# Obtener la dirección IP
ip_address=$(ip -4 addr show wlan0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}')

# Obtener el nombre de host (localhost)
hostname=$(hostname)

# Obtener la dirección MAC
mac_address=$(ip link show wlan0 | awk '/ether/ {print $2}')

# Obtener información del dispositivo
device_info=$(getprop ro.product.model)
android_version=$(getprop ro.build.version.release)
kernel_version=$(uname -r)

# Mostrar la información con colores llamativos
echo -e "${CYAN}Información del dispositivo:${NC}"
echo -e "${GREEN}Fecha y Hora Actual:${NC} ${current_datetime}"
echo -e "${GREEN}Dirección IP:${NC} ${ip_address}"
echo -e "${GREEN}Nombre de Host (localhost):${NC} ${hostname}"
echo -e "${GREEN}Dirección MAC:${NC} ${mac_address}"
echo -e "${GREEN}Modelo de dispositivo:${NC} ${device_info}"
echo -e "${GREEN}Versión de Android:${NC} ${android_version}"
echo -e "${GREEN}Versión del Kernel:${NC} ${kernel_version}"
