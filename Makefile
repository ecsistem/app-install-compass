#Update & Upgade
update_and_upgrade:
sudo apt update -y && sudo apt upgrade -y && sudo apt-get install curl -y


# Instalar o Snap
install-snap:
    sudo apt install snapd


# Oracle JDK 8
install_oracle_jdk_8:
    sudo apt install openjdk-8-jre -y
	sudo apt install openjdk-8-jdk -y

# Oracle JDK 11
install_oracle_jdk_11:
    sudo apt-get install openjdk-11-jdk -y

# SDKMAN para Java
install_sdkman:
    curl -s "https://get.sdkman.io" | bash
	source "$HOME/.sdkman/bin/sdkman-init.sh"
	sdk version

# Instalação do Maven
install_maven:
    sudo apt install -y maven

# Instalação do NVM
install_nvm:
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# Instalação do rvm e Ruby
install_rvm:
    sudo apt install -y software-properties-common
    sudo apt-add-repository -y ppa:rael-gc/rvm
	sudo apt-get update
    sudo apt install -y rvm
    source /etc/profile.d/rvm.sh

# Instalação do Go Lang
install_go:
    curl -OL https://golang.org/dl/go1.13.15.linux-amd64.tar.gz
    sudo tar -C /usr/local -xvf go1.13.15.linux-amd64.tar.gz
    echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.profile
    source ~/.profile

# Instalação do Git
install_git:
    sudo add-apt-repository -y ppa:git-core/ppa
    sudo apt update
    sudo apt install -y git
	
# Executar também os comandos abaixo para evitar o erro:  error: RPC failed; HTTP 301 curl 22 The requested URL returned error: 301 fatal: the remote end hung up unexpectedly
	git config --global http.followRedirects true
	git config --global http.postBuffer 1073741824

# Instalação do Docker
install_docker:
    curl -fsSL https://get.docker.com -o get-docker.sh
    sudo sh get-docker.sh
    sudo usermod -aG docker $USER

# Instalação do Docker Compose
install_docker_compose:
    sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose

# Instalação do NoSQLBooster
install_nosqlbooster:
    wget -O NoSQLBooster.tar.gz "https://s3.nosqlbooster.com/download/releasesv8/nosqlbooster4mongo-8.1.9.AppImage"
    sudo mkdir /opt/NoSQLBooster
    sudo tar -zxvf NoSQLBooster.tar.gz -C /opt/NoSQLBooster --strip-components=1

# Instalação do Postman
install_postman:
    wget -O Postman.tar.gz "https://dl.pstmn.io/download/latest/linux64"
    sudo mkdir /opt/Postman
    sudo tar -zxvf Postman.tar.gz -C /opt/Postman --strip-components=1

# Instalação do SoapUI
install_soapui:
    wget -O SoapUI.tar.gz "https://s3.amazonaws.com/downloads.eviware/soapuios/5.6.0/SoapUI-x64-5.6.0.sh"
    sudo chmod +x SoapUI.tar.gz
    sudo ./SoapUI.tar.gz -q -dir /opt/SoapUI

# Instalação do Helm
install_helm:
    sudo snap install helm --classic

# Instalação do kubectl
install_kubectl:
    snap install kubectl --classic
	kubectl version --client

# Instalação do k9s
install_k9s:
    brew install derailed/k9s/k9s

# Instalação do ChromeDriver
install_chromedriver:
   # Baixar o ChromeDriver para Linux de 32 bits
    wget https://chromedriver.storage.googleapis.com/2.0/chromedriver_linux64.zip
    # Descompactar o ChromeDriver
    unzip chromedriver_linux_64.zip
    # Mover o ChromeDriver para /usr/bin
    sudo mv chromedriver /usr/bin
    # Dar permissão de leitura/escrita ao ChromeDriver
    sudo chmod 755 /usr/bin/chromedriver
    # Remover o arquivo zip baixado
    rm chromedriver_linux32.zip

# Define o alvo para baixar e instalar o GeckoDriver
install-geckodriver:
    # Baixar o GeckoDriver para o seu sistema operacional e arquitetura
    # (substitua "v0.31.0" pela versão correspondente à do seu Firefox)
    wget https://github.com/mozilla/geckodriver/releases/download/v0.34.0/geckodriver-v0.34.0-linux64.tar.gz
    # Descompactar o GeckoDriver
    tar -xvzf geckodriver-v0.34.0-linux64.tar.gz
    # Mover o GeckoDriver para /usr/bin
    sudo mv geckodriver /usr/bin
    # Remover o arquivo tar.gz baixado
    rm geckodriver-v0.34.0-linux64.tar.gz


# Regras especiais
all: update_and_upgrade install-snap install_oracle_jdk_8 install_oracle_jdk_11 install_sdkman install_maven install_nvm install_rvm install_go install_git install_docker install_docker_compose install_nosqlbooster install_postman install_soapui install_helm install_kubectl install_k9s install_chromedriver install_geckodriver

.PHONY: all
