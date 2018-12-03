//Code needed for Max
const path = require('path');
const Max = require('max-api');
const dotEnv = require('dotenv').config();
var nodeBinanceApi = require("node-binance-api"); //Call the NPM package

if (!process.env.BINANCE_API_KEY) throw new Error("Missing Binance API Key");
if (!process.env.BINANCE_API_SECRET) throw new Error("Missing Binance API Secret");

// Various variables
let priceFor; // Holds the name of a pair for finding the price (eg BTCUSDT)
let balanceFor; // Holds the name of a crypto for finding the balance (eg BTC)
let askBidFor; // Holds the ticker pair name for Bid/Ask (eg BTCUSDT)
let marketDepthOf; // Holds the ticker pair name for Market Depth (eg BTCUSDT)

let sandboxOnOff = true; // sandbox mode where orders are simulated is turned on

// Code necessary for Binance 
const binance = require('node-binance-api')().options({
  APIKEY: process.env.BINANCE_API_KEY,
  APISECRET: process.env.BINANCE_API_SECRET,
  useServerTime: true, // If you get timestamp errors, synchronize to server time at startup
  test: sandboxOnOff // If you want to use sandbox mode where orders are simulated
});

// Turn sandbox on and off 
Max.addHandler("sandbox", (sandboxState) => {
  sandboxOnOff = sandboxState;
  const binance = require('node-binance-api')().options({
    test: sandboxOnOff // If you want to use sandbox mode where orders are simulated
  });
  Max.outlet("Sandbox is", sandboxOnOff);
});

// This will be printed directly to the Max console
Max.post(`loaded the ${path.basename(__filename)} script`); // Message to Max that the script has been loaded
Max.post("Node script running");
//Max.outlet("Added API key: " + process.env.BINANCE_API_KEY);

// Getting latest price of a symbol
Max.addHandler("getPriceOf", (priceFor) => {
  binance.prices(priceFor, (error, ticker) => {
    //Max.post('Price of ' + symbolName + ' ' + ticker[symbolName]); // original code: console.log("Price of BNB: ", ticker.BNBBTC);
    Max.outlet(priceFor + ' ' + ticker[priceFor]);
  });
});

// Getting latest price of all symbols / pairs
Max.addHandler("getPricesForAll", () => {
  binance.prices((error, ticker) => {
    //Max.post("prices()", ticker);
    Max.outlet("prices()", ticker);
  });
});


// Getting current balance for a specific crypto
Max.addHandler("getCurrentBalanceFor", (balanceFor) => {
  binance.balance((error, balances) => {
    if (error) return Max.outlet(error);
    // original code: console.log("ETH balance: ", balances.ETH.available);
    Max.outlet(balanceFor + " balance: ", balances[balanceFor].available);
  });
});

// Getting list of current balances
Max.addHandler("getListOfCurrentBalances", () => {
  binance.balance((error, balances) => {
    if (error) return Max.outlet(error);
    //Max.post("balances()", balances);
    Max.outlet("balances()", balances);
  });
});

// Getting bid/ask prices for a symbol
Max.addHandler("getBidAskPriceFor", (askBidFor) => {
  binance.bookTickers(askBidFor, (error, ticker) => {
    Max.outlet("Bid/Ask Price: ", ticker);
  });
});

// Get all bid/ask prices
Max.addHandler("getBidAskPriceForAll", () => {
  binance.bookTickers((error, ticker) => {
    Max.outlet("Bid/Ask Price for All: ", ticker);
  });
});

// Get market depth for a symbol
Max.addHandler("getMarketDepth", (marketDepthOf) => {
  binance.depth(marketDepthOf, (error, depth, symbol) => {
    Max.outlet(symbol + " market depth", depth);
  });
});

// Placing a BUY market order
// These orders will be executed at current market price.
Max.addHandler("setBuyMarketOrder", (buyMarketOrderFor, buyMarketOrderQuantity) => {
  binance.marketBuy(buyMarketOrderFor, buyMarketOrderQuantity);
  Max.outlet("Bought: ", buyMarketOrderFor, buyMarketOrderQuantity);
})

// Placing a SELL market order
// These orders will be executed at current market price.
Max.addHandler("setSellMarketOrder", (sellMarketOrderFor, sellMarketOrderQuantity) => {
  binance.marketSell(sellMarketOrderFor, sellMarketOrderQuantity);
  Max.outlet("Sold: ", sellMarketOrderFor, sellMarketOrderQuantity);
});

// Placing a BUY LIMIT order
Max.addHandler("setBuyLimitOrder", (buyLimitOrderFor, buyLimitOrderQuantity, buyLimitOrderPrice) => {
  binance.buy(buyLimitOrderFor, buyLimitOrderQuantity, buyLimitOrderPrice);
  Max.outlet("Bought: ", buyLimitOrderFor, buyMarketOrderQuantity, buyLimitOrderPrice);
});

// Placing a SELL LIMIT order
Max.addHandler("setSellLimitOrder", (sellLimitOrderFor, sellLimitOrderQuantity, sellLimitOrderPrice) => {
  binance.sell(sellLimitOrderFor, sellLimitOrderQuantity, sellLimitOrderPrice);
  Max.outlet("Sold: ", sellLimitOrderFor, sellMarketOrderQuantity, sellLimitOrderPrice);
});

// Placing a STOP LOSS order
// When the stop is reached, a stop order becomes a market order
// Note: You must also pass one of these type parameters:
// STOP_LOSS, STOP_LOSS_LIMIT, TAKE_PROFIT, TAKE_PROFIT_LIMIT
Max.addHandler("setStopLossOrder", (stopLossType, stopLossOrderFor, stopLossOrderQuantity, stopLossOrderPrice, stopPrice) => {
  let type = "STOP_LOSS";
  binance.sell(stopLossOrderFor, stopLossOrderQuantity, stopLossOrderPrice, {
    stopPrice: stopPrice,
    type: stopLossType
  });
});

// Get list of all open orders
Max.addHandler("getListOfAllOrders", () => {
  binance.openOrders(false, (error, openOrders) => {
    Max.outlet("Open Orders: ", openOrders);
  });
});

// Trade history
Max.addHandler("getTradeHistoryFor", (tradeHistoryFor) => {
  binance.trades(tradeHistoryFor, (error, trades, symbol) => {
    Max.outlet(symbol + " trade history", trades);
  });
});

// Get Kline/candlestick data for a symbol
// You can use the optional API parameters for getting historical candlesticks, these are useful if you want to import data from earlier back in time. Optional parameters: limit (max/default 500), startTime, endTime.
// Intervals: 1m,3m,5m,15m,30m,1h,2h,4h,6h,8h,12h,1d,3d,1w,1M
Max.addHandler("getCandlestickFor", (candlestickFor, candlestickInterval) => {
  binance.candlesticks(candlestickFor, candlestickInterval, (error, ticks, symbol) => {
    Max.outlet("Candlesticks: ", ticks);
    let last_tick = ticks[ticks.length - 1];
    let [time, open, high, low, close, volume, closeTime, assetVolume, trades, buyBaseVolume, buyAssetVolume, ignored] = last_tick;
    Max.outlet(symbol + " last close: " + close);
  }, { limit: 500, endTime: 1514764800000 });
});

// Cancel an order
Max.addHandler("setCancelOrder", (cancelOrderFor) => {
  binance.cancel(cancelOrderFor, orderid, (error, response, symbol) => {
    Max.outlet(symbol + " cancel response:", response);
  });
});

// Cancel all open orders
Max.addHandler("setCancelAllOrders", (cancelAllOrders) => {
  binance.cancelOrders("XMRBTC", (error, response, symbol) => {
    Max.outlet(symbol + " cancel response:", response);
  });
});