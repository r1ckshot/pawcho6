# 🐳 Laboratorium 6: GitHub Container Registry (ghcr.io)

## 📥 Pobieranie obrazu z rejestru ghcr.io
docker pull ghcr.io/r1ckshot/pawcho6:lab6

## 🚀 Uruchamianie kontenera
docker run -d -p 8080:80 --name lab6-app ghcr.io/r1ckshot/pawcho6:lab6

## ✅ Weryfikacja działania
curl http://localhost:8080

## 🛠️ Budowa obrazu (opcjonalnie)

### Krok 1: Sklonowanie repozytorium
git clone git@github.com:r1ckshot/pawcho6.git
cd pawcho6

### Krok 2: Przygotowanie agenta SSH (wymagane do klonowania wewnątrz Dockera)
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/github_ed25519 

### Krok 3: Budowa obrazu z tagiem i wersją
docker build --ssh default --build-arg VERSION=lab6 -t ghcr.io/r1ckshot/pawcho6:lab6 .

# Autor Mykhailo Kapustianyk
