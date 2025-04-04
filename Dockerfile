# ---------- ETAP 1: Budowanie aplikacji ----------
# Obraz oparty na Alpine z Node.js – do generowania strony HTML
FROM node:alpine AS builder

# Katalog roboczy w kontenerze
WORKDIR /app

# Skopiowanie skryptu Node.js
COPY index.js .

# Przekazanie wersji z zewnątrz (podczas docker build)
ARG VERSION=dev
ENV VERSION=$VERSION

# Uruchomienie aplikacji, wygenerowanie index.html z danymi serwera
RUN node index.js > index.html

# ---------- ETAP 2: Serwer Nginx ----------
# Gotowy, lekki serwer HTTP
FROM nginx:alpine

# Skopiowanie wygenerowanego pliku HTML jako strona startowa
COPY --from=builder /app/index.html /usr/share/nginx/html/index.html

# Automatyczne sprawdzanie stanu aplikacji
HEALTHCHECK --interval=30s --timeout=3s \
  CMD wget -qO- http://localhost || exit 1
