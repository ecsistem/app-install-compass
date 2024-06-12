# Projeto de Configuração de Ambiente

Este projeto contém um script `setup.sh` que automatiza a instalação de várias ferramentas e dependências necessárias para desenvolvimento. 

## Índice

- [Instalações Incluídas](#instalações-incluídas)
- [Como Usar o Script de Configuração](#como-usar-o-script-de-configuração)

## Instalações Incluídas

O script `setup.sh` realiza as seguintes instalações:

- Atualização e upgrade do sistema
- Snap
- Brew
- Visual Studio Code Editor
- Oracle JDK 8 e 11
- SDKMAN para Java
- Maven
- NVM (Node Version Manager)
- RVM (Ruby Version Manager) e Ruby
- Go Lang
- Git
- Docker e Docker Compose
- NoSQLBooster
- Postman
- SoapUI
- Helm
- kubectl
- k9s
- ChromeDriver
- GeckoDriver

## Como Usar o Script de Configuração

### Pré-requisitos

- Ubuntu (ou uma distribuição baseada em Debian)
- Permissões de superusuário (sudo)

### Passos

1. Clone o repositório:

    ```sh
    git clone https://github.com/ecsistem/app-install-compass.git
    cd app-install-compass
    ```

2. Torne o script executável:

    ```sh
    chmod +x setup.sh
    ```

3. Execute o script com um:

    ```sh
    ./setup.sh
    ```