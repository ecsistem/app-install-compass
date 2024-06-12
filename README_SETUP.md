# Projeto de Configuração de Ambiente

Este projeto contém um script `setup.sh` que automatiza a instalação de várias ferramentas e dependências necessárias para desenvolvimento. Além disso, está configurado para utilizar o GitHub Actions para CI/CD.

## Índice

- [Instalações Incluídas](#instalações-incluídas)
- [Como Usar o Script de Configuração](#como-usar-o-script-de-configuração)
- [Pipeline de GitHub Actions](#pipeline-de-github-actions)
- [Contribuição](#contribuição)
- [Licença](#licença)

## Instalações Incluídas

O script `setup.sh` realiza as seguintes instalações:

- Atualização e upgrade do sistema
- Snap
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
    git clone https://github.com/seu-usuario/seu-repositorio.git
    cd seu-repositorio
    ```

2. Torne o script executável:

    ```sh
    chmod +x setup.sh
    ```

3. Execute o script com a opção `all` para instalar todas as ferramentas:

    ```sh
    ./setup.sh all
    ```

### Executando Tarefas Específicas

Você pode executar tarefas específicas passando o nome da tarefa como argumento. Por exemplo, para instalar apenas o Maven:

```sh
./setup.sh install_maven
