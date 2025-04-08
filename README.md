# 🐳 Laboratorium 6: Aplikacja w Chmurze z GitHub Container Registry (ghcr.io)

## 📥 Pobieranie obrazu z rejestru ghcr.io
docker pull ghcr.io/r1ckshot/pawcho6:lab6

## 🛠️ Budowa obrazu (opcjonalnie)

### 1) Aktywacja agenta SSH (wymagane do klonowania repozytorium)
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/github_ed25519

### 2) Budowa obrazu z tagiem i wersją
docker build --ssh default --build-arg VERSION=lab6 -t ghcr.io/r1ckshot/pawcho6:lab6 .

## 🚀 Uruchamianie kontenera
docker run -d -p 8080:80 --name lab6-app ghcr.io/r1ckshot/pawcho6:lab6

## ✅ Weryfikacja działania
curl http://localhost:8080

# Autor Mykhailo Kapustianyk
