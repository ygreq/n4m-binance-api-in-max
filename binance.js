// Code needed for Max
const path = require('path');
const Max = require('max-api');
const dotEnv = require('dotenv').config();
const Binance = require('node-binance-api'); // v1.x: class-based, Promise API

if (!process.env.BINANCE_API_KEY) throw new Error("Missing Binance API Key");
if (!process.env.BINANCE_API_SECRET) throw new Error("Missing Binance API Secret");

// Validate that a symbol/pair string only contains safe characters (A-Z, 0-9, 2-20 chars)
function isValidSymbol(symbol) {
  return typeof symbol === 'string' && /^[A-Z0-9]{2,20}$/.test(symbol);
}

// Various variables
let sandboxOnOff = true; // sandbox mode where orders are simulated is turned on

// Code necessary for Binance — v1.x uses `new Binance()` class constructor
// All REST methods now return Promises (no callbacks)
const binance = new Binance().options({
  APIKEY: process.env.BINANCE_API_KEY,
  APISECRET: process.env.BINANCE_API_SECRET,
  useServerTime: true, // If you get timestamp errors, synchronize to server time at startup
  test: sandboxOnOff // If you want to use sandbox mode where orders are simulated
});

Max.post('Node script running');

// Turn sandbox on and off
Max.addHandler("sandbox", (sandboxState) => {
  sandboxOnOff = sandboxState;
  // Update the existing binance instance's options (don't create a throwaway local)
  binance.setOption('test', sandboxOnOff);
  Max.outlet("Sandbox is", sandboxOnOff);
});

// Getting latest price of a symbol
Max.addHandler("getPriceOf", async (priceFor) => {
  if (!isValidSymbol(priceFor)) return Max.outlet("error", "Invalid symbol: " + priceFor);
  try {
    const ticker = await binance.prices(priceFor);
    Max.outlet(priceFor + ' ' + ticker[priceFor]);
  } catch (error) {
    Max.outlet("error", error.body || error.message || error);
  }
});

// Getting latest price of all symbols / pairs
Max.addHandler("getPricesForAll", async () => {
  try {
    const ticker = await binance.prices();
    Max.outlet("prices()", ticker);
  } catch (error) {
    Max.outlet("error", error.body || error.message || error);
  }
});

// Getting current balance for a specific crypto
Max.addHandler("getCurrentBalanceFor", async (balanceFor) => {
  if (!isValidSymbol(balanceFor)) return Max.outlet("error", "Invalid symbol: " + balanceFor);
  try {
    const balances = await binance.balance();
    if (!balances[balanceFor]) return Max.outlet("error", "No balance found for " + balanceFor);
    Max.outlet(balanceFor + " balance: ", balances[balanceFor].available);
  } catch (error) {
    Max.outlet("error", error.body || error.message || error);
  }
});

// Getting list of current balances
Max.addHandler("getListOfCurrentBalances", async () => {
  try {
    const balances = await binance.balance();
    Max.outlet("balances()", balances);
  } catch (error) {
    Max.outlet("error", error.body || error.message || error);
  }
});

// Getting bid/ask prices for a symbol
Max.addHandler("getBidAskPriceFor", async (askBidFor) => {
  if (!isValidSymbol(askBidFor)) return Max.outlet("error", "Invalid symbol: " + askBidFor);
  try {
    const ticker = await binance.bookTickers(askBidFor);
    Max.outlet("Bid/Ask Price: ", ticker);
  } catch (error) {
    Max.outlet("error", error.body || error.message || error);
  }
});

// Get all bid/ask prices
Max.addHandler("getBidAskPriceForAll", async () => {
  try {
    const ticker = await binance.bookTickers();
    Max.outlet("Bid/Ask Price for All: ", ticker);
  } catch (error) {
    Max.outlet("error", error.body || error.message || error);
  }
});

// Get market depth for a symbol
// v1.x: depth(symbol, limit) returns Promise<OrderBook> — no symbol in return
Max.addHandler("getMarketDepth", async (marketDepthOf) => {
  if (!isValidSymbol(marketDepthOf)) return Max.outlet("error", "Invalid symbol: " + marketDepthOf);
  try {
    const depth = await binance.depth(marketDepthOf);
    Max.outlet(marketDepthOf + " market depth", depth);
  } catch (error) {
    Max.outlet("error", error.body || error.message || error);
  }
});

// Placing a BUY market order
// These orders will be executed at current market price.
Max.addHandler("setBuyMarketOrder", async (buyMarketOrderFor, buyMarketOrderQuantity) => {
  if (!isValidSymbol(buyMarketOrderFor)) return Max.outlet("error", "Invalid symbol: " + buyMarketOrderFor);
  try {
    const response = await binance.marketBuy(buyMarketOrderFor, buyMarketOrderQuantity);
    Max.outlet("Bought: ", buyMarketOrderFor, buyMarketOrderQuantity, "orderId:", response.orderId);
  } catch (error) {
    Max.outlet("error", error.body || error.message || error);
  }
});

// Placing a SELL market order
// These orders will be executed at current market price.
Max.addHandler("setSellMarketOrder", async (sellMarketOrderFor, sellMarketOrderQuantity) => {
  if (!isValidSymbol(sellMarketOrderFor)) return Max.outlet("error", "Invalid symbol: " + sellMarketOrderFor);
  try {
    const response = await binance.marketSell(sellMarketOrderFor, sellMarketOrderQuantity);
    Max.outlet("Sold: ", sellMarketOrderFor, sellMarketOrderQuantity, "orderId:", response.orderId);
  } catch (error) {
    Max.outlet("error", error.body || error.message || error);
  }
});

// Placing a BUY LIMIT order
// v1.x: buy() hardcodes type='LIMIT' internally
Max.addHandler("setBuyLimitOrder", async (buyLimitOrderFor, buyLimitOrderQuantity, buyLimitOrderPrice) => {
  if (!isValidSymbol(buyLimitOrderFor)) return Max.outlet("error", "Invalid symbol: " + buyLimitOrderFor);
  try {
    const response = await binance.buy(buyLimitOrderFor, buyLimitOrderQuantity, buyLimitOrderPrice);
    Max.outlet("Bought: ", buyLimitOrderFor, buyLimitOrderQuantity, buyLimitOrderPrice, "orderId:", response.orderId);
  } catch (error) {
    Max.outlet("error", error.body || error.message || error);
  }
});

// Placing a SELL LIMIT order
// v1.x: sell() hardcodes type='LIMIT' internally
Max.addHandler("setSellLimitOrder", async (sellLimitOrderFor, sellLimitOrderQuantity, sellLimitOrderPrice) => {
  if (!isValidSymbol(sellLimitOrderFor)) return Max.outlet("error", "Invalid symbol: " + sellLimitOrderFor);
  try {
    const response = await binance.sell(sellLimitOrderFor, sellLimitOrderQuantity, sellLimitOrderPrice);
    Max.outlet("Sold: ", sellLimitOrderFor, sellLimitOrderQuantity, sellLimitOrderPrice, "orderId:", response.orderId);
  } catch (error) {
    Max.outlet("error", error.body || error.message || error);
  }
});

// Placing a STOP LOSS order
// When the stop is reached, a stop order becomes a market order
// Note: You must also pass one of these type parameters:
// STOP_LOSS, STOP_LOSS_LIMIT, TAKE_PROFIT, TAKE_PROFIT_LIMIT
// v1.x: must use order() directly — buy()/sell() hardcode type='LIMIT'
Max.addHandler("setStopLossOrder", async (stopLossType, stopLossOrderFor, stopLossOrderQuantity, stopLossOrderPrice, stopPrice) => {
  if (!isValidSymbol(stopLossOrderFor)) return Max.outlet("error", "Invalid symbol: " + stopLossOrderFor);
  try {
    const response = await binance.order(stopLossType, 'SELL', stopLossOrderFor, stopLossOrderQuantity, stopLossOrderPrice, {
      stopPrice: stopPrice
    });
    Max.outlet("Stop loss set: ", stopLossOrderFor, stopLossOrderQuantity, stopLossOrderPrice, "orderId:", response.orderId);
  } catch (error) {
    Max.outlet("error", error.body || error.message || error);
  }
});

// Get list of all open orders
// v1.x: openOrders() with no args returns all; no longer accepts `false`
Max.addHandler("getListOfAllOrders", async () => {
  try {
    const openOrders = await binance.openOrders();
    Max.outlet("Open Orders: ", openOrders);
  } catch (error) {
    Max.outlet("error", error.body || error.message || error);
  }
});

// Trade history
Max.addHandler("getTradeHistoryFor", async (tradeHistoryFor) => {
  if (!isValidSymbol(tradeHistoryFor)) return Max.outlet("error", "Invalid symbol: " + tradeHistoryFor);
  try {
    const trades = await binance.trades(tradeHistoryFor);
    Max.outlet(tradeHistoryFor + " trade history", trades);
  } catch (error) {
    Max.outlet("error", error.body || error.message || error);
  }
});

// Get Kline/candlestick data for a symbol
// Optional parameters: limit (max/default 500), startTime, endTime.
// Intervals: 1m,3m,5m,15m,30m,1h,2h,4h,6h,8h,12h,1d,3d,1w,1M
// v1.x: candlesticks(symbol, interval, params) returns Candle[] with named properties
Max.addHandler("getCandlestickFor", async (candlestickFor, candlestickInterval) => {
  if (!isValidSymbol(candlestickFor)) return Max.outlet("error", "Invalid symbol: " + candlestickFor);
  try {
    const ticks = await binance.candlesticks(candlestickFor, candlestickInterval, { limit: 500, endTime: 1514764800000 });
    Max.outlet("Candlesticks: ", ticks);
    // v1.x returns Candle objects with named properties instead of raw arrays
    const last_tick = ticks[ticks.length - 1];
    Max.outlet(candlestickFor + " last close: " + last_tick.close);
  } catch (error) {
    Max.outlet("error", error.body || error.message || error);
  }
});

// Cancel an order
// v1.x: cancel(symbol, orderId) returns Promise<CancelOrder>
Max.addHandler("setCancelOrder", async (cancelOrderFor, orderId) => {
  if (!isValidSymbol(cancelOrderFor)) return Max.outlet("error", "Invalid symbol: " + cancelOrderFor);
  if (!orderId) return Max.outlet("error", "Missing order ID");
  try {
    const response = await binance.cancel(cancelOrderFor, orderId);
    Max.outlet(cancelOrderFor + " cancel response:", response);
  } catch (error) {
    Max.outlet("error", error.body || error.message || error);
  }
});

// Cancel all open orders for a symbol
// v1.x: cancelOrders() no longer exists — use cancelAll() or cancelAllOrders()
Max.addHandler("setCancelAllOrders", async (cancelAllFor) => {
  if (!isValidSymbol(cancelAllFor)) return Max.outlet("error", "Invalid symbol: " + cancelAllFor);
  try {
    const response = await binance.cancelAll(cancelAllFor);
    Max.outlet(cancelAllFor + " cancel response:", response);
  } catch (error) {
    Max.outlet("error", error.body || error.message || error);
  }
});