#!/bin/bash

# Função para atualizar e fazer upgrade
update_and_upgrade() {
    sudo apt update -y && sudo apt upgrade -y
    sudo apt-get install curl -y
}


# Função para instalar o Snap
install_snap() {
    sudo apt install -y snapd
}

# Função para instalar o Brew
install_brew(){
    sudo apt-get install build-essential curl file git
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    echo "eval $($(brew --prefix)/bin/brew shellenv)" >>~/.profile
    brew install hello
}

# Função para instalar o Snap
install_code() {
    snap install code
}

# Função para instalar o Oracle JDK 8
install_oracle_jdk_8() {
    sudo apt install -y openjdk-8-jre
    sudo apt install -y openjdk-8-jdk
}

# Função para instalar o Oracle JDK 11
install_oracle_jdk_11() {
    sudo apt-get install -y openjdk-11-jdk
}

# Função para instalar o SDKMAN para Java
install_sdkman() {
    curl -s "https://get.sdkman.io" | bash
    source "$HOME/.sdkman/bin/sdkman-init.sh"
    sdk version
}

# Função para instalar o Maven
install_maven() {
    sudo apt install -y maven #mvn -version
}

# Função para instalar o NVM
install_nvm() {
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
}

# Função para instalar o RVM e Ruby (não pegou)
install_rvm() {
    sudo apt install -y software-properties-common
    sudo apt-add-repository -y ppa:rael-gc/rvm
    sudo apt-get update
    sudo apt install -y rvm
    source /etc/profile.d/rvm.sh
    snap install ruby
}

# Função para instalar o Go Lang
install_go() {
    snap install go --classic 
}

# Função para instalar o Git
install_git() {
    sudo add-apt-repository -y ppa:git-core/ppa
    sudo apt update
    sudo apt install -y git
    git config --global http.followRedirects true
    git config --global http.postBuffer 1073741824
}

# Função para instalar o Docker
install_docker() {
    snap install docker
}

# Função para instalar o Docker Compose
install_docker_compose() {
    sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
}

# Função para instalar o NoSQLBooster
install_nosqlbooster() {
    wget -O NoSQLBooster.tar.gz "https://s3.nosqlbooster.com/download/releasesv8/nosqlbooster4mongo-8.1.9.AppImage"
    sudo mkdir /opt/NoSQLBooster
    sudo tar -zxvf NoSQLBooster.tar.gz -C /opt/NoSQLBooster --strip-components=1
}

# Função para instalar o Postman
install_postman() {
    sudo snap install postman
}

# Função para instalar o SoapUI
install_soapui() {
    wget -O SoapUI.tar.gz "https://s3.amazonaws.com/downloads.eviware/soapuios/5.6.0/SoapUI-x64-5.6.0.sh"
    sudo chmod +x SoapUI.tar.gz
    sudo ./SoapUI.tar.gz -q -dir /opt/SoapUI
}

# Função para instalar o Helm
install_helm() {
    sudo snap install helm --classic
}

# Função para instalar o kubectl
install_kubectl() {
    sudo snap install kubectl --classic
    kubectl version --client
}

# Função para instalar o k9s
install_k9s() {
    brew install k9s
}

# Função para instalar o ChromeDriver
install_chromedriver() {
    wget https://chromedriver.storage.googleapis.com/2.0/chromedriver_linux64.zip
    unzip chromedriver_linux64.zip
    sudo mv chromedriver /usr/bin
    sudo chmod 755 /usr/bin/chromedriver
    rm chromedriver_linux64.zip
    echo "chromedriver instalado com sucesso!!!"
}

# Função para instalar o GeckoDriver
install_geckodriver() {
    wget https://github.com/mozilla/geckodriver/releases/download/v0.34.0/geckodriver-v0.34.0-linux64.tar.gz
    tar -xvzf geckodriver-v0.34.0-linux64.tar.gz
    sudo mv geckodriver /usr/bin
    rm geckodriver-v0.34.0-linux64.tar.gz
}

# Menu para executar todas as funções ou funções específicas
all() {
    update_and_upgrade
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

# Verifica os argumentos passados e executa as funções correspondentes
case "$1" in
    update_and_upgrade) update_and_upgrade ;;
    install_snap) install_snap ;;
    install_brew) install_brew ;;
    install_code) install_code ;;
    install_oracle_jdk_8) install_oracle_jdk_8 ;;
    install_oracle_jdk_11) install_oracle_jdk_11 ;;
    install_sdkman) install_sdkman ;;
    install_maven) install_maven ;;
    install_nvm) install_nvm ;;
    install_rvm) install_rvm ;;
    install_go) install_go ;;
    install_git) install_git ;;
    install_docker) install_docker ;;
    install_docker_compose) install_docker_compose ;;
    install_nosqlbooster) install_nosqlbooster ;;
    install_postman) install_postman ;;
    install_soapui) install_soapui ;;
    install_helm) install_helm ;;
    install_kubectl) install_kubectl ;;
    install_k9s) install_k9s ;;
    install_chromedriver) install_chromedriver ;;
    install_geckodriver) install_geckodriver ;;
    all) all ;;
    *) echo "Uso: $0 {all|update_and_upgrade|install_snap|install_brew|install_code|install_oracle_jdk_8|install_oracle_jdk_11|install_sdkman|install_maven|install_nvm|install_rvm|install_go|install_git|install_docker|install_docker_compose|install_nosqlbooster|install_postman|install_soapui|install_helm|install_kubectl|install_k9s|install_chromedriver|install_geckodriver}" ;;
esac
