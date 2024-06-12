#!/bin/bash

# Função para registrar a instalação no log
log_installation() {
    echo "[$(date)] $1 instalado" >> installation_log.txt
}

#Atualizar e instalar o  curl
update_and_upgrade() {
    sudo apt update -y && sudo apt upgrade -y
    sudo apt-get install curl -y
    log_installation "Alualização do apt"
    echo -e "${GREEN}Atualização e upgrade concluídos com sucesso!!!${NC}"
}

# Função para instalar o Snap
install_snap() {
    sudo apt install -y snapd
    log_installation "Snap"
    echo -e "${GREEN}Snap instalado com sucesso!!!${NC}"
}

# Função para instalar o Brew
install_brew(){
    sudo apt-get install build-essential curl file git
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    echo "eval $($(brew --prefix)/bin/brew shellenv)" >>~/.profile
    brew install hello
    log_installation "Brew"
    echo -e "${GREEN}Brew instalado com sucesso!!!${NC}"
}

# Função para instalar o Team 
install_team() {
    snap install teams-for-linux 
    log_installation "Team"
    echo -e "${GREEN}Team instalado com sucesso!!!${NC}"
}

# Função para instalar o Visual Studio Code
install_code() {
    snap install code
    log_installation "Visual Studio Code"
    echo -e "${GREEN}Visual Studio Code instalado com sucesso!!!${NC}"
}

# Função para instalar o Oracle JDK 8
install_oracle_jdk_8() {
    sudo apt install -y openjdk-8-jre
    sudo apt install -y openjdk-8-jdk
    log_installation "Oracle JDK 8"
    echo -e "${GREEN}Oracle JDK 8 instalado com sucesso!!!${NC}"
}

# Função para instalar o Oracle JDK 11
install_oracle_jdk_11() {
    sudo apt-get install -y openjdk-11-jdk
    log_installation "Oracle JDK 11"
    echo -e "${GREEN}Oracle JDK 11 instalado com sucesso!!!${NC}"
}

# Função para instalar o SDKMAN para Java
install_sdkman() {
    curl -s "https://get.sdkman.io" | bash
    source "$HOME/.sdkman/bin/sdkman-init.sh"
    sdk version
    log_installation "SDKMAN"
    echo -e "${GREEN}SDKMAN instalado com sucesso!!!${NC}"
}

# Função para instalar o Maven
install_maven() {
    sudo apt install -y maven #mvn -version
    log_installation "Maven"
    echo -e "${GREEN}Maven instalado com sucesso!!!${NC}"
}

# Função para instalar o NVM
install_nvm() {
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
    log_installation "NVM"
    echo -e "${GREEN}NVM instalado com sucesso!!!${NC}"
}

# Função para instalar o RVM e Ruby (não pegou)
install_rvm() {
    sudo apt install -y software-properties-common
    sudo apt-add-repository -y ppa:rael-gc/rvm
    sudo apt-get update
    sudo apt install -y rvm
    source /etc/profile.d/rvm.sh
    snap install ruby
    log_installation "RVM e Ruby"
    echo -e "${GREEN}RVM e Ruby instalados com sucesso!!!${NC}"
}

# Função para instalar o Go Lang
install_go() {
    snap install go --classic 
    log_installation "Go Lang"
    echo -e "${GREEN}Go Lang instalado com sucesso!!!${NC}"
}

# Função para instalar o Git
install_git() {
    sudo add-apt-repository -y ppa:git-core/ppa
    sudo apt update
    sudo apt install -y git
    git config --global http.followRedirects true
    git config --global http.postBuffer 1073741824
    log_installation "Git"
    echo -e "${GREEN}Git instalado com sucesso!!!${NC}"
}

# Função para instalar o Docker
install_docker() {
    snap install docker
    log_installation "Docker"
    echo -e "${GREEN}Docker instalado com sucesso!!!${NC}"
}

# Função para instalar o Docker Compose
install_docker_compose() {
    sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    log_installation "Docker Compose"
    echo -e "${GREEN}Docker Compose instalado com sucesso!!!${NC}"
}

# Função para instalar o NoSQLBooster
install_nosqlbooster() {
    wget -O NoSQLBooster.tar.gz "https://s3.nosqlbooster.com/download/releasesv8/nosqlbooster4mongo-8.1.9.AppImage"
    sudo mkdir /opt/NoSQLBooster
    sudo tar -zxvf NoSQLBooster.tar.gz -C /opt/NoSQLBooster --strip-components=1
    log_installation "NoSQLBooster"
    echo -e "${GREEN}NoSQLBooster instalado com sucesso!!!${NC}"
}

# Função para instalar o Postman
install_postman() {
    sudo snap install postman
    log_installation "Postman"
    echo -e "${GREEN}Postman instalado com sucesso!!!${NC}"
}

# Função para instalar o SoapUI
install_soapui() {
    wget -O SoapUI.tar.gz "https://s3.amazonaws.com/downloads.eviware/soapuios/5.6.0/SoapUI-x64-5.6.0.sh"
    sudo chmod +x SoapUI.tar.gz
    sudo ./SoapUI.tar.gz -q -dir /opt/SoapUI
    log_installation "SoapUI"
    echo -e "${GREEN}SoapUI instalado com sucesso!!!${NC}"
}

# Função para instalar o Helm
install_helm() {
    sudo snap install helm --classic
    log_installation "Helm"
    echo -e "${GREEN}Helm instalado com sucesso!!!${NC}"
}

# Função para instalar o kubectl
install_kubectl() {
    sudo snap install kubectl --classic
    kubectl version --client
    log_installation "kubectl"
    echo -e "${GREEN}Kubectl instalado com sucesso!!!${NC}"
}

# Função para instalar o k9s
install_k9s() {
    brew install k9s
    log_installation "k9s"
    echo -e "${GREEN}k9s instalado com sucesso!!!${NC}"
}

# Função para instalar o ChromeDriver
install_chromedriver() {
    wget https://chromedriver.storage.googleapis.com/2.0/chromedriver_linux64.zip
    unzip chromedriver_linux64.zip
    sudo mv chromedriver /usr/bin
    sudo chmod 755 /usr/bin/chromedriver
    log_installation "ChromeDriver"
    echo -e "${GREEN}chromedriver instalado com sucesso!!!${NC}"
}

# Função para instalar o GeckoDriver
install_geckodriver() {
    wget https://github.com/mozilla/geckodriver/releases/download/v0.34.0/geckodriver-v0.34.0-linux64.tar.gz
    tar -xvzf geckodriver-v0.34.0-linux64.tar.gz
    sudo mv geckodriver /usr/bin
    log_installation "GeckoDriver"
    echo -e "${GREEN}GeckoDriver instalado com sucesso!!!${NC}"
}

# Função para registrar todas as instalações no log
all() {
    update_and_upgrade
    install_team
    install_snap
    install_brew
    install_code
    install_oracle_jdk_8
    install_oracle_jdk_11
    install_sdkman
    install_maven
    install_nvm
    install_rvm
    install_go
    install_git
    install_docker
    install_docker_compose
    install_nosqlbooster
    install_postman
    install_soapui
    install_helm
    install_kubectl
    install_k9s
    install_chromedriver
    install_geckodriver
}

# Menu para executar todas as funções ou funções específicas
menu() {
    clear
    echo -e "${YELLOW}== MENU DE INSTALAÇÃO ==${NC}"
    echo "Selecione uma opção:"
    echo "  1) Atualizar e fazer upgrade"
    echo "  2) Instalar Snap"
    echo "  3) Instalar Brew"
    echo "  4) Instalar Visual Studio Code"
    echo "  5) Instalar Oracle JDK 8"
    echo "  6) Instalar Oracle JDK 11"
    echo "  7) Instalar SDKMAN para Java"
    echo "  8) Instalar Maven"
    echo "  9) Instalar NVM"
    echo "  10) Instalar RVM e Ruby"
    echo "  11) Instalar Go Lang"
    echo "  12) Instalar Git"
    echo "  13) Instalar Docker"
    echo "  14) Instalar Docker Compose"
    echo "  15) Instalar NoSQLBooster"
    echo "  16) Instalar Postman"
    echo "  17) Instalar SoapUI"
    echo "  18) Instalar Helm"
    echo "  19) Instalar kubectl"
    echo "  20) Instalar k9s"
    echo "  21) Instalar ChromeDriver"
    echo "  22) Instalar GeckoDriver"
    echo "  23) Instalar Team"
    echo "  24) Executar todas as instalações"
    echo "  0) Sair"
    read -p "Escolha uma opção: " option
    case $option in
        1) update_and_upgrade ;;
        2) install_snap ;;
        3) install_brew ;;
        4) install_code ;;
        5) install_oracle_jdk_8 ;;
        6) install_oracle_jdk_11 ;;
        7) install_sdkman ;;
        8) install_maven ;;
        9) install_nvm ;;
        10) install_rvm ;;
        11) install_go ;;
        12) install_git ;;
        13) install_docker ;;
        14) install_docker_compose ;;
        15) install_nosqlbooster ;;
        16) install_postman ;;
        17) install_soapui ;;
        18) install_helm ;;
        19) install_kubectl ;;
        20) install_k9s ;;
        21) install_chromedriver ;;
        22) install_geckodriver ;;
        23) install_team ;;
        24) all ;;
        0) echo "Saindo..."; exit ;;
        *) echo -e "${YELLOW}Opção inválida!${NC}"; menu ;;
    esac
    menu
}

# Iniciar o menu
menu
