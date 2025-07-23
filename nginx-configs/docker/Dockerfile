FROM nginx:alpine

# Copia arquivos de config
COPY nginx.conf /etc/nginx/nginx.conf
COPY conf.d/ /etc/nginx/conf.d/
COPY sites-available/ /etc/nginx/sites-available/
COPY snippets/ /etc/nginx/snippets/

# Habilita sites
RUN rm -f /etc/nginx/sites-enabled/* && \
    ln -s /etc/nginx/sites-available/* /etc/nginx/sites-enabled/

# Testa config
RUN nginx -t

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]