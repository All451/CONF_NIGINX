### ✅ `README.md`

```markdown
# 🛠️ Repositório de Configurações NGINX

> **Gerencie, versione e implante configurações do NGINX com segurança e boas práticas.**

Este repositório contém configurações organizadas, seguras e escaláveis do **NGINX**, prontas para uso em ambientes de **desenvolvimento, homologação e produção**.

🔧 Ideal para:
- Servidores web e proxy reverso
- Hospedagem de múltiplos sites (virtual hosts)
- Aplicações Node.js, Python, PHP, APIs, SPA, etc.
- Uso com Docker, CI/CD e automação (Ansible, Terraform, etc)

---

## 🚀 Como Usar

### 1. Clone o repositório

```bash
git clone https://github.com/seu-usuario/nginx-configs.git
cd nginx-configs
```

### 2. Implante no servidor

> ⚠️ Execute com permissões de `sudo` ou como usuário root.

```bash
# Copiar configurações para o diretório do NGINX
sudo cp -r sites-available/* /etc/nginx/sites-available/
sudo cp -r sites-enabled/* /etc/nginx/sites-enabled/
sudo cp conf.d/* /etc/nginx/conf.d/
sudo cp snippets/* /etc/nginx/snippets/
sudo cp nginx.conf /etc/nginx/nginx.conf

# Testar configuração
sudo nginx -t

# Recarregar NGINX
sudo nginx -s reload
```

### 3. Usar com Docker

```bash
cd docker
docker-compose up --build -d
```

> O NGINX será iniciado com todas as configurações do repositório.

---

## 🧩 Exemplos de Sites

### 🌐 Site Estático ou App (meusite.com.br)

- Redireciona HTTP → HTTPS
- Proxy para backend na porta 3000
- Cache para arquivos estáticos (CSS, JS, imagens)

📁 Arquivo: `sites-available/meusite.com.br.conf`

### 🔌 API (api.minhaapp.com)

- HTTPS com SSL
- Proxy para serviço na porta 5000
- Cabeçalhos de proxy seguros

📁 Arquivo: `sites-available/api.minhaapp.com.conf`

---

## 🔐 Segurança

As configurações incluem:

- **HTTPS obrigatório** (com redirecionamento)
- **Cabeçalhos de segurança** (HSTS, XSS, CSP, etc)
- **Proteção contra clickjacking** (`X-Frame-Options`)
- **TLS moderno** (v1.2 e v1.3)
- **Gzip** para melhorar performance
- **Timeouts** ajustados para produção

🔐 Snippets usados:
- `snippets/ssl-params.conf`
- `conf.d/security-headers.conf`

---

## 🐳 Docker Integration

O repositório inclui suporte a Docker para testes locais ou ambientes containerizados.

### Arquivos:
- `docker/Dockerfile` – Imagem personalizada com suas configurações
- `docker/docker-compose.yml` – Subir NGINX com mapeamento de volumes

> Útil para testes locais, CI/CD ou ambientes de staging.

---

## 🛠️ Scripts Úteis

| Script                   | Função                                      |
|--------------------------|---------------------------------------------|
| `scripts/test-config.sh` | Testa a sintaxe do NGINX (`nginx -t`)       |
| `scripts/reload-nginx.sh`| Testa e recarrega o NGINX com segurança     |

### Como usar:
```bash
chmod +x scripts/*.sh
./scripts/test-config.sh
./scripts/reload-nginx.sh
```

---

## 🔄 Boas Práticas Adotadas

- ✅ **Versionamento** com Git  
- ✅ **Ambientes separados** (dev, staging, prod)  
- ✅ **Reutilização com snippets**  
- ✅ **Segurança por padrão**  
- ✅ **Estrutura clara e documentada**  
- ✅ **Compatível com automação (CI/CD, Ansible, etc)**

> 📌 **Dica**: Nunca versione certificados, chaves ou senhas! Use `.gitignore`.

---

## 🤝 Contribuição

Sinta-se à vontade para:
- 🔁 Forkar este repositório
- 🐛 Abrir issues para bugs ou melhorias
- 🚀 Enviar Pull Requests com novas funcionalidades

---

## 📄 Licença

Este projeto está licenciado sob a **MIT License** – veja o arquivo [LICENSE](LICENSE) para detalhes.

---
