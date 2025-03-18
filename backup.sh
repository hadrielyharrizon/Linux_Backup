#!/bin/bash

# Diretório de origem (modifique conforme necessário)
ORIGEM="$HOME/meus-arquivos"

# Diretório de backup (modifique conforme necessário)
DESTINO="$HOME/backup"

# Nome do arquivo de backup com a data atual
DATA=$(date +"%Y-%m-%d")
ARQUIVO_BACKUP="backup-$DATA.tar.gz"

# Cria o diretório de origem caso não exista
mkdir -p "$ORIGEM"

# Cria o diretório de backup se não existir
mkdir -p "$DESTINO"

# Cria o backup compactado
if [ "$(ls -A $ORIGEM 2>/dev/null)" ]; then
    tar -czf "$DESTINO/$ARQUIVO_BACKUP" -C "$ORIGEM" .
    echo "Backup criado com sucesso: $DESTINO/$ARQUIVO_BACKUP"
else
    echo "Erro: O diretório $ORIGEM está vazio. Adicione arquivos antes de fazer o backup."
    exit 1
fi

# Exibe mensagem de sucesso
echo "Backup criado com sucesso em: $DESTINO/$ARQUIVO_BACKUP"
