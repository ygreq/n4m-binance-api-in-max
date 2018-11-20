//Max stuff
const path = require('path');
const Max = require('max-api');

var nodeBinanceApi = require("node-binance-api"); //Call the NPM package
let symbolName; // Holds the ticker pair name (eg BTCUSDT)

const binance = require('node-binance-api')().options({
  APIKEY: '<key>',
  APISECRET: '<secret>',
  useServerTime: true, // If you get timestamp errors, synchronize to server time at startup
  test: true // If you want to use sandbox mode where orders are simulated
});

// This will be printed directly to the Max console
Max.post(`loaded the ${path.basename(__filename)} script`); // Message that the script has been loaded

// Getting latest price of a symbol
Max.addHandler("symbolSelector", (symbolName) => {
  binance.prices(symbolName, (error, ticker) => {
    Max.post('Price of ' + symbolName + ' ' + ticker[symbolName]);
    Max.outlet(symbolName + ' ' + ticker[symbolName]);
  });
});

// Getting latest price of all symbols
Max.addHandler("getPriceForAllSymbols", () => {
  binance.prices((error, ticker) => {
    Max.post("prices()", ticker);
    Max.outlet("prices()", ticker);
  });
});