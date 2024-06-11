# Script de Instalação de Aplicativos

Este projeto contém um script Bash para instalar prograamas usando o  `snap`. A lista de aplicativos é configurada em um arquivo separado para facilitar a manutenção.

## Arquivos

- `install_apps.sh`: Script principal para instalar os aplicativos.
- `apps_list.conf`: Arquivo de configuração contendo a lista de aplicativos a serem instalados.

## Instruções de Uso

### 1. Clone o repositório (ou baixe os arquivos)

Clone este repositório para o seu diretório local ou simplesmente baixe os arquivos `install_apps.sh` e `apps_list.conf`.

```bash
git clone https://github.com/ecsistem/repositorio.git
cd repositorio
```

### 2. Verifique o conteúdo do arquivo de configuração

Abra o arquivo `apps_list.conf` e verifique a lista de aplicativos. O formato do arquivo deve ser:

```conf
<nome_do_pacote>:<descrição>
```

Exemplo:

```conf
teams:Microsoft Teams
code:Visual Studio Code --classic
postman:Postman
```

### 3. Torne o script principal executável

Execute o comando a seguir para dar permissão de execução ao script:

```bash
chmod +x install_apps.sh
```

### 4. Execute o script principal

Execute o script para instalar os aplicativos listados no arquivo de configuração:

```bash
./install_apps.sh
```

### 5. Verifique a saída

O script irá atualizar a lista de pacotes, instalar o `snapd` (caso não esteja instalado), e então instalar os aplicativos listados no `apps_list.conf`. O progresso e os resultados das instalações serão exibidos no terminal.

## Estrutura do Projeto

```plaintext
.
├── install_apps.sh
└── apps_list.conf
```

## Personalização

Você pode adicionar ou remover aplicativos editando o arquivo `apps_list.conf`. Basta adicionar uma linha para cada aplicativo que deseja instalar, no formato `<nome_do_pacote>:<descrição>`.

Exemplo:

```conf
discord:Discord
spotify:Spotify
```

## Observações

- Este script foi testado em sistemas baseados em Debian (como Ubuntu).
- Certifique-se de ter permissões de superusuário para executar os comandos `sudo`.
