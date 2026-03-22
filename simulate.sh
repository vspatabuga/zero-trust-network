#!/usr/bin/env bash

set -e

BLUE='\033[0;34m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${BLUE}"
cat << "BANNER"
   ╔═╗╔═╗╔═╗╔═╗╔═╗╔╗╔╔═╗╔═╗╔═╗╔╗╔
   ║ ╦║ ╦║ ╦║ ║║ ║║║║║ ║║ ║║ ║║║║
   ╚═╝╚═╝╚═╝╚═╝╚═╝╚╩╝╚═╝╚═╝╚═╝╝╚╝
   
   ZERO-TRUST - Identity-Centric Security Simulation
BANNER
echo -e "${NC}"

SIM_DIR="/tmp/vsp-zero-trust"
PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo -e "${YELLOW}>> Initializing Zero-Trust in ${SIM_DIR}...${NC}"

rm -rf "$SIM_DIR"
mkdir -p "$SIM_DIR"
cp -r "$PROJECT_DIR"/* "$SIM_DIR/"
cd "$SIM_DIR"

echo -e ">> Building Docker images..."
if command -v docker-compose &> /dev/null; then
    docker-compose -p vsp-zero-trust up --build -d
else
    docker compose -p vsp-zero-trust up --build -d
fi

echo -e "\n${GREEN}✔ Zero-Trust Successfully Simulated!${NC}"
echo -e "================================================================================="
echo -e "🔐 ${BLUE}Secure Proxy${NC}:    https://localhost:3004"
echo -e "🌍 ${BLUE}Web UI${NC}:          http://localhost:3005"
echo -e "🔑 ${BLUE}Vaultwarden${NC}:     (internal)"
echo -e ""
echo -e "🛑 To teardown: cd $SIM_DIR && docker compose -p vsp-zero-trust down"
echo -e "================================================================================="
