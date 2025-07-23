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

## 📁 Estrutura do Projeto

```
nginx-configs/
├── sites-available/     → Configurações completas dos sites (virtual hosts)
├── sites-enabled/       → Sites ativos (habilitados no NGINX)
├── conf.d/              → Configurações extras (gzip, segurança, timeouts)
├── snippets/            → Blocos reutilizáveis (SSL, proxy, cache)
├── nginx.conf           → Configuração principal
├── nginx.conf.prod      → Modelo para produção
├── nginx.conf.dev       → Modelo para desenvolvimento
├── docker/              → Dockerfile e docker-compose.yml
├── scripts/             → Scripts úteis (test, reload)
├── README.md            → Este arquivo
├── LICENSE              → Licença de uso
└── .gitignore           → Arquivos ignorados pelo Git
```

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

| Script | Função |
|-------|--------|
| `scripts/test-config.sh` | Testa a sintaxe do NGINX (`nginx -t`) |
| `scripts/reload-nginx.sh` | Testa + recarrega o NGINX com segurança |

### Como usar:
```bash
chmod +x scripts/*.sh
./scripts/test-config.sh
./scripts/reload-nginx.sh
```

---

## 🔄 Boas Práticas Adotadas

- ✅ **Versionamento** com Git
- ✅ **Ambientes separados** (dev, prod)
- ✅ **Reutilização com snippets**
- ✅ **Segurança por padrão**
- ✅ **Estrutura clara e documentada**
- ✅ **Compatível com automação**

> 📌 Nunca versione certificados ou senhas! Use `.gitignore`.

---

## 🤝 Contribuição

Sinta-se à vontade para:
- Forkar este repositório
- Abrir issues para melhorias
- Enviar PRs com novos snippets, sites ou otimizações

---

## 📄 Licença

Este projeto está licenciado sob a **MIT License** – veja o arquivo [LICENSE](LICENSE) para detalhes.
