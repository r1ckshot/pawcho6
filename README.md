# 🐳 PAwChO Lab 6 - Zaawansowane BuildKit i GitHub Container Registry

## ☁️ Pobieranie obrazu z GitHub Container Registry
docker pull ghcr.io/r1ckshot/pawcho6:lab6

## 📦 Wymagane: uruchomiony agent SSH z kluczem
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/github_ed25519

## 🛠️Budowa obrazu z tagem lab6
docker build --ssh default -t ghcr.io/r1ckshot/pawcho6:lab6 .

## 🚀 Uruchamianie serwera
docker run -d -p 8080:80 --name pawcho6-container ghcr.io/r1ckshot/pawcho6:lab6

## ✅ Weryfikacja działania
curl http://localhost:8080

# Autor Mykhailo Kapustianyk
