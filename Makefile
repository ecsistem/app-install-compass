# Makefile para instalar aplicativos usando snap

# Nome do arquivo de configuração
CONFIG_FILE = apps_list.conf

# Alvo padrão
all: install

# Alvo para instalar aplicativos
install: check-config
	chmod +x install_apps.sh
	./install_apps.sh

# Alvo para verificar se o arquivo de configuração existe
check-config:
	@if [ ! -f $(CONFIG_FILE) ]; then \
		echo "Arquivo de configuração $(CONFIG_FILE) não encontrado."; \
		exit 1; \
	fi

# Alvo para limpar arquivos gerados (se necessário)
clean:
	# Adicione comandos de limpeza se houver algum arquivo gerado

.PHONY: all install check-config clean
