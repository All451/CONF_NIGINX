#!/bin/bash
echo "Testando e recarregando NGINX..."
if sudo nginx -t; then
    sudo nginx -s reload
    echo "NGINX recarregado com sucesso."
else
    echo "Erro na configuração. Nada foi alterado."
    exit 1
fi