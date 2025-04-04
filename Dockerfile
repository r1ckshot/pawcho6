# syntax=docker/dockerfile:1.4

# ---------- ETAP 0: Pobieranie kodu z Git ----------
  FROM alpine/git AS source
  WORKDIR /app
  RUN --mount=type=ssh \
      git clone git@github.com:r1ckshot/pawcho6.git . 
  
  # ---------- ETAP 1: Budowanie aplikacji ----------
  FROM node:alpine AS builder
  WORKDIR /app
  COPY --from=source /app/index.js .
  ARG VERSION=lab6
  ENV VERSION=$VERSION
  RUN node index.js > index.html
  
  # ---------- ETAP 2: Serwer Nginx ----------
  FROM nginx:alpine
  COPY --from=builder /app/index.html /usr/share/nginx/html/index.html
  HEALTHCHECK --interval=30s --timeout=3s \
    CMD wget -qO- http://localhost || exit 1