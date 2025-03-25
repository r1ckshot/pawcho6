const os = require('os'); // Import wbudowanego modułu systemowego
const ip = Object.values(os.networkInterfaces()) // Pobranie IP serwera (pierwszy nie-wewnętrzny adres IPv4)
  .flat().find(i => i.family === 'IPv4' && !i.internal)?.address;
const hostname = os.hostname(); // // Pobranie nazwy hosta
const version = process.env.VERSION || 'dev'; // Wersja przekazywana przez ENV

// Generowanie strony HTML i wypisanie jej na stdout
console.log(`<html><body>
<h1>Wersja: ${version}</h1>
<p>IP: ${ip}</p>
<p>Host: ${hostname}</p>
</body></html>`);