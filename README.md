# pawcho6
Additional task
=======
## 🛠️ Budowa obrazu
docker build --build-arg VERSION=1.0.0 -t webapp:multi .

## 🚀 Uruchamianie serwera
docker run -d -p 8080:80 --name mywebapp webapp:multi

## ✅ Weryfikacja działania
curl http://localhost:8080

# Autor Mykhailo Kapustianyk