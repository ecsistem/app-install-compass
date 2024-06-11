#!/bin/bash

# Função para exibir mensagens com cor
function print_message() {
    COLOR=$1
    MESSAGE=$2
    NC='\033[0m' # Sem cor
    echo -e "${COLOR}${MESSAGE}${NC}"
}

# Cores para mensagens
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'

# Atualiza a lista de pacotes
print_message $YELLOW "Atualizando a lista de pacotes..."
if sudo apt update; then
    print_message $GREEN "Lista de pacotes atualizada com sucesso."
else
    print_message $RED "Falha ao atualizar a lista de pacotes."
    exit 1
fi

# Instala o snapd caso não esteja instalado
print_message $YELLOW "Instalando o snapd..."
if sudo apt install snapd -y; then
    print_message $GREEN "Snapd instalado com sucesso."
else
    print_message $RED "Falha ao instalar o snapd."
    exit 1
fi

# Verifica se o arquivo de configuração existe
CONFIG_FILE="apps_list.conf"
if [ ! -f "$CONFIG_FILE" ]; then
    print_message $RED "Arquivo de configuração $CONFIG_FILE não encontrado."
    exit 1
fi

# Lê a lista de aplicativos do arquivo de configuração
declare -A apps
while IFS=":" read -r key value; do
    apps["$key"]="$value"
done < "$CONFIG_FILE"

# Instala os aplicativos
for app in "${!apps[@]}"; do
    print_message $YELLOW "Instalando ${apps[$app]}..."
    if sudo snap install $app ${apps[$app]}; then
        print_message $GREEN "${apps[$app]} instalado com sucesso."
    else
        print_message $RED "Falha ao instalar ${apps[$app]}."
        exit 1
    fi
done

# Verifica se as instalações foram bem-sucedidas
print_message $YELLOW "Verificando as instalações..."

for app in "${!apps[@]}"; do
    if snap list | grep -q $app; then
        print_message $GREEN "${apps[$app]} está instalado."
    else
        print_message $RED "Falha ao instalar ${apps[$app]}."
    fi
done

print_message $GREEN "Instalação concluída."
