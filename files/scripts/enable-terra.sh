#!/bin/bash
set -e

# 1. Baixar o arquivo de configuração do repositório Terra
curl -fsSL https://github.com/terrapkg/subatomic-repos/raw/main/terra.repo -o /etc/yum.repos.d/terra.repo

# 2. Importar manualmente a chave GPG do Terra (para evitar falha na verificação de assinatura)
rpm --import https://repos.fyralabs.com/terra$releasever/key.asc 2>/dev/null || true

# 3. Usar --nogpgcheck para instalar o terra-release (a documentação oficial afirma que a primeira instalação precisa pular a verificação)
dnf install -y --nogpgcheck terra-release

# 4. Após a instalação, a chave já está no local, e os pacotes subsequentes podem ser verificados normalmente
