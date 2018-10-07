const path = require('path');
const Max = require('max-api');
var nodeBinanceApi = require("node-binance-api");
let tickerName; // Holds the ticker pair name (eg BTCUSDT)

const binance = require('node-binance-api')().options({
  APIKEY: '<key>', 
  APISECRET: '<secret>',
  useServerTime: true, // If you get timestamp errors, synchronize to server time at startup
  test: true // If you want to use sandbox mode where orders are simulated
});

// This will be printed directly to the Max console
Max.post(`loaded the ${path.basename(__filename)} script`);

// Use the 'addHandler' function to register a function for a particular message
Max.addHandler("tickerNameSelector", (tickerName) => {
    binance.prices(tickerName, (error, ticker) => {
      Max.post('Price of '+ tickerName + ' ' + ticker[tickerName]); 
      Max.outlet(tickerName + ' ' + ticker[tickerName]);
      });
});
