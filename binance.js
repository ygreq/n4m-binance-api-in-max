//Code needed for Max
const path = require('path');
const Max = require('max-api');

var nodeBinanceApi = require("node-binance-api"); //Call the NPM package
let symbolName; // Holds the ticker pair name (eg BTCUSDT)
let cryptoBalance; // Holds the name of a crypto for finding the balance (eg BTC)

let apiKey = '<>';
let apiSecret = '<>';

Max.addHandler("key", (keyFromMax) => {
  apiKey = keyFromMax;
  Max.outlet(apiKey);
});

Max.addHandler("secret", (secretFromMax) => {
  apiSecret = secretFromMax;
  Max.outlet(apiSecret);
});
Max.outlet("API Key is: " + apiKey);
Max.outlet("API Secret is: " + apiSecret);

const binance = require('node-binance-api')().options({
  APIKEY: apiKey,
  APISECRET: apiSecret,
  useServerTime: true, // If you get timestamp errors, synchronize to server time at startup
  test: true // If you want to use sandbox mode where orders are simulated
});

// This will be printed directly to the Max console
Max.post(`loaded the ${path.basename(__filename)} script`); // Message to Max that the script has been loaded

// Getting latest price of a symbol
Max.addHandler("symbolSelector", (symbolName) => {
  binance.prices(symbolName, (error, ticker) => {
    Max.post('Price of ' + symbolName + ' ' + ticker[symbolName]); // original code: console.log("Price of BNB: ", ticker.BNBBTC);
    Max.outlet(symbolName + ' ' + ticker[symbolName]);
  });
});

// Getting latest price of all symbols / pairs
Max.addHandler("getPriceForAllSymbols", () => {
  binance.prices((error, ticker) => {
    Max.post("prices()", ticker);
    Max.outlet("prices()", ticker);
  });
});

// Getting list of current balances
Max.addHandler("getListOfCurrentBalances", () => {
  binance.balance((error, balances) => {
    if (error) return Max.outlet(error);
    Max.post("balances()", balances);
    Max.outlet("balances()", balances);
  });
});

// Getting current balance for a specific crypto
Max.addHandler("getCurrentBalance", (cryptoBalance) => {
  binance.balance((error, balances) => {
    if (error) return console.error(error);
    Max.post(cryptoBalance + " balance: ", balances[cryptoBalance].available); // original code: console.log("ETH balance: ", balances.ETH.available);
    Max.post("BTC balance: ", balances.BTC.available);
  });
});