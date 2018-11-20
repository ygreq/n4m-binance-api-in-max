{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 8,
			"minor" : 0,
			"revision" : 1,
			"architecture" : "x64",
			"modernui" : 1
		}
,
		"classnamespace" : "box",
		"rect" : [ 39.0, 86.0, 1276.0, 680.0 ],
		"bglocked" : 0,
		"openinpresentation" : 0,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 1,
		"gridsize" : [ 15.0, 15.0 ],
		"gridsnaponopen" : 1,
		"objectsnaponopen" : 1,
		"statusbarvisible" : 2,
		"toolbarvisible" : 1,
		"lefttoolbarpinned" : 0,
		"toptoolbarpinned" : 0,
		"righttoolbarpinned" : 0,
		"bottomtoolbarpinned" : 0,
		"toolbars_unpinned_last_save" : 0,
		"tallnewobj" : 0,
		"boxanimatetime" : 200,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"description" : "",
		"digest" : "",
		"tags" : "",
		"style" : "",
		"subpatcher_template" : "",
		"boxes" : [ 			{
				"box" : 				{
					"id" : "obj-33",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "int" ],
					"patching_rect" : [ 551.0, 93.5, 29.5, 22.0 ],
					"text" : "t l 2"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-32",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 418.0, 244.0, 42.0, 22.0 ],
					"text" : "gate 2"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-31",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "int" ],
					"patching_rect" : [ 406.0, 53.0, 31.0, 22.0 ],
					"text" : "t s 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-30",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 418.0, 293.0, 72.0, 22.0 ],
					"text" : "prepend set"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-29",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 4,
					"outlettype" : [ "dictionary", "", "", "" ],
					"patching_rect" : [ 418.0, 344.0, 50.5, 22.0 ],
					"saved_object_attributes" : 					{
						"embed" : 0,
						"parameter_enable" : 0,
						"parameter_mappable" : 0
					}
,
					"text" : "dict"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-27",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 0,
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 8,
							"minor" : 0,
							"revision" : 1,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"classnamespace" : "box",
						"rect" : [ 34.0, 77.0, 1468.0, 713.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"objectsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"lefttoolbarpinned" : 0,
						"toptoolbarpinned" : 0,
						"righttoolbarpinned" : 0,
						"bottomtoolbarpinned" : 0,
						"toolbars_unpinned_last_save" : 0,
						"tallnewobj" : 0,
						"boxanimatetime" : 200,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"style" : "",
						"subpatcher_template" : "",
						"boxes" : [ 							{
								"box" : 								{
									"id" : "obj-1",
									"linecount" : 222,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 11.0, 6.0, 1462.0, 2983.0 ],
									"text" : "Getting started\n\nconst binance = require('node-binance-api')().options({\n  APIKEY: '<key>',\n  APISECRET: '<secret>',\n  useServerTime: true, // If you get timestamp errors, synchronize to server time at startup\n  test: true // If you want to use sandbox mode where orders are simulated\n});\n\n\nInstantiating Multiple Instances\n\nconst Binance = require('node-binance-api');\n \nconst instance1 = new Binance().options({\n  // ...\n});\n \nconst instance2 = new Binance().options({\n  // ...\n});\n\n\nGetting latest price of a symbol\n\nbinance.prices('BNBBTC', (error, ticker) => {\n  console.log(\"Price of BNB: \", ticker.BNBBTC);\n});\n\n\nGetting latest price of all symbols\n\nbinance.prices((error, ticker) => {\n  console.log(\"prices()\", ticker);\n  console.log(\"Price of BTC: \", ticker.BTCUSDT);\n});\n\n\nView Response\nGetting list of current balances\n\nbinance.balance((error, balances) => {\n  if ( error ) return console.error(error);\n  console.log(\"balances()\", balances);\n  console.log(\"ETH balance: \", balances.ETH.available);\n});\n// If you have problems with this function,\n// see Troubleshooting at the bottom of this page.\n\n\nView Response\nGetting bid/ask prices for a symbol\n\nbinance.bookTickers('BNBBTC', (error, ticker) => {\n  console.log(\"bookTickers\", ticker);\n});\n\n\nView Response\nGetting bid/ask prices for all symbols\n\nbinance.bookTickers((error, ticker) => {\n  console.log(\"bookTickers()\", ticker);\n  console.log(\"Price of BNB: \", ticker.BNBBTC);\n});\n\n\nView Response\nGet all bid/ask prices\n\n\nbinance.bookTickers((error, ticker) => {\n  console.log(\"bookTickers\", ticker);\n});\n\n\nView Response\nGet market depth for a symbol\n\n\nbinance.depth(\"BNBBTC\", (error, depth, symbol) => {\n  console.log(symbol+\" market depth\", depth);\n});\n\n\nView Response\nPlacing a LIMIT order\n\nvar quantity = 1, price = 0.069;\nbinance.buy(\"ETHBTC\", quantity, price);\nbinance.sell(\"ETHBTC\", quantity, price);\n\n\nPlacing a MARKET order\n\n// These orders will be executed at current market price.\nvar quantity = 1;\nbinance.marketBuy(\"BNBBTC\", quantity);\nbinance.marketSell(\"ETHBTC\", quantity);\n\n\nLIMIT order with callback\n\nvar quantity = 5, price = 0.00402030;\nbinance.buy(\"BNBETH\", quantity, price, {type:'LIMIT'}, (error, response) => {\n  console.log(\"Limit Buy response\", response);\n  console.log(\"order id: \" + response.orderId);\n});\n\n\nView Response\nChaining orders together\n\nvar quantity = 1;\nbinance.marketBuy(\"BNBBTC\", quantity, (error, response) => {\n  console.log(\"Market Buy response\", response);\n  console.log(\"order id: \" + response.orderId);\n  // Now you can limit sell with a stop loss, etc.\n});\n\n\nView Response\nPlacing a STOP LOSS order\n\n// When the stop is reached, a stop order becomes a market order\n// Note: You must also pass one of these type parameters:\n// STOP_LOSS, STOP_LOSS_LIMIT, TAKE_PROFIT, TAKE_PROFIT_LIMIT\nlet type = \"STOP_LOSS\";\nlet quantity = 1;\nlet price = 0.069;\nlet stopPrice = 0.068;\nbinance.sell(\"ETHBTC\", quantity, price, {stopPrice: stopPrice, type: type});\n\n\nPlacing an ICEBERG order\n\n// Iceberg orders are intended to conceal the order quantity.\nvar quantity = 1;\nvar price = 0.069;\nbinance.sell(\"ETHBTC\", quantity, price, {icebergQty: 10});\n\n\nCancel an order\n\nbinance.cancel(\"ETHBTC\", orderid, (error, response, symbol) => {\n  console.log(symbol+\" cancel response:\", response);\n});\n\n\nCancel all open orders\n\nbinance.cancelOrders(\"XMRBTC\", (error, response, symbol) => {\n  console.log(symbol+\" cancel response:\", response);\n});\n\n\nGet open orders for a symbol\n\nbinance.openOrders(\"ETHBTC\", (error, openOrders, symbol) => {\n  console.log(\"openOrders(\"+symbol+\")\", openOrders);\n});\n\n\nGet list of all open orders\n\nbinance.openOrders(false, (error, openOrders) => {\n  console.log(\"openOrders()\", openOrders);\n});\n\n\nCheck an order's status\n\nlet orderid = \"7610385\";\nbinance.orderStatus(\"ETHBTC\", orderid, (error, orderStatus, symbol) => {\n  console.log(symbol+\" order status:\", orderStatus);\n});\n\n\nTrade history\n\nbinance.trades(\"SNMBTC\", (error, trades, symbol) => {\n  console.log(symbol+\" trade history\", trades);\n});\n\n\nView Response\nGet all account orders; active, canceled, or filled.\n\nbinance.allOrders(\"ETHBTC\", (error, orders, symbol) => {\n  console.log(symbol+\" orders:\", orders);\n});\n\n\nGet 24hr ticker price change statistics for all symbols\n\nbinance.prevDay(false, (error, prevDay) => {\n  // console.log(prevDay); // view all data\n  for ( let obj of prevDay ) {\n    let symbol = obj.symbol;\n    console.log(symbol+\" volume:\"+obj.volume+\" change: \"+obj.priceChangePercent+\"%\");\n  }\n});\n\n\nGet 24hr ticker price change statistics for a symbol\n\nbinance.prevDay(\"BNBBTC\", (error, prevDay, symbol) => {\n  console.log(symbol+\" previous day:\", prevDay);\n  console.log(\"BNB change since yesterday: \"+prevDay.priceChangePercent+\"%\")\n});\n\n\nGet Kline/candlestick data for a symbol\nYou can use the optional API parameters for getting historical candlesticks, these are useful if you want to import data from earlier back in time. Optional parameters: limit (max/default 500), startTime, endTime.\n\n// Intervals: 1m,3m,5m,15m,30m,1h,2h,4h,6h,8h,12h,1d,3d,1w,1M\nbinance.candlesticks(\"BNBBTC\", \"5m\", (error, ticks, symbol) => {\n  console.log(\"candlesticks()\", ticks);\n  let last_tick = ticks[ticks.length - 1];\n  let [time, open, high, low, close, volume, closeTime, assetVolume, trades, buyBaseVolume, buyAssetVolume, ignored] = last_tick;\n  console.log(symbol+\" last close: \"+close);\n}, {limit: 500, endTime: 1514764800000});"
								}

							}
 ],
						"lines" : [  ]
					}
,
					"patching_rect" : [ 308.5, 11.0, 38.0, 22.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"globalpatchername" : "",
						"tags" : ""
					}
,
					"text" : "p info"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-24",
					"linecount" : 4,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 807.0, 99.0, 78.0, 60.0 ],
					"text" : "type the pair you want to follow and press enter"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-21",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 890.0, 258.5, 86.0, 33.0 ],
					"text" : "capitalize all letters."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-14",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 794.0, 346.0, 84.0, 22.0 ],
					"text" : "BTCUSDT"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-16",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 691.0, 346.0, 96.0, 22.0 ],
					"text" : "print upperCase"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-10",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 691.0, 264.0, 191.0, 22.0 ],
					"text" : "vexpr $i1-32*($i1>96 && $i1<123)"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-20",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 691.0, 289.0, 46.0, 22.0 ],
					"text" : "itoa"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-25",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "list" ],
					"patching_rect" : [ 691.0, 239.0, 46.0, 22.0 ],
					"text" : "atoi"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-23",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "clear", "bang" ],
					"patching_rect" : [ 691.0, 65.0, 51.0, 22.0 ],
					"text" : "t clear b"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-22",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 691.0, 189.0, 59.0, 22.0 ],
					"text" : "route text"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-19",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "bang", "" ],
					"patching_rect" : [ 718.0, 152.5, 41.0, 22.0 ],
					"text" : "sel 13"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-18",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 450.0, 42.0, 86.0, 33.0 ],
					"text" : "Get the price list of all pairs"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-15",
					"maxclass" : "textedit",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 691.0, 99.0, 100.0, 50.0 ],
					"text" : "btcusdt"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-9",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 494.0, 293.0, 91.0, 22.0 ],
					"text" : "print Max.outlet"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-8",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 406.0, 11.0, 130.0, 22.0 ],
					"text" : "getPriceForAllSymbols"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-17",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 691.0, 11.0, 118.0, 33.0 ],
					"text" : "Switch from Max which pair to follow"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-12",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 551.0, 11.0, 65.0, 22.0 ],
					"text" : "BTCUSDT"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-13",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 624.0, 11.0, 57.0, 22.0 ],
					"text" : "BNBBTC"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-11",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 555.0, 53.0, 107.0, 22.0 ],
					"text" : "symbolSelector $1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-28",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 281.5, 56.0, 65.0, 22.0 ],
					"text" : "script stop"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-7",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 352.5, 55.0, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-6",
					"lockeddragscroll" : 0,
					"maxclass" : "bpatcher",
					"name" : "n4m.monitor.maxpat",
					"numinlets" : 1,
					"numoutlets" : 0,
					"offset" : [ 0.0, 0.0 ],
					"patching_rect" : [ 15.0, 183.5, 396.0, 223.0 ],
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-5",
					"linecount" : 2,
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 460.0, 177.0, 125.0, 35.0 ],
					"text" : "\"BTCUSDT 4558.24000000\""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-3",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 214.0, 56.0, 64.0, 22.0 ],
					"text" : "script start"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-4",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 15.0, 56.0, 194.0, 22.0 ],
					"text" : "script npm install node-binance-api"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 1.0, 0.741176, 0.196078, 1.0 ],
					"fontsize" : 12.0,
					"id" : "obj-2",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 15.0, 134.0, 125.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 153.0, 353.0, 174.0, 22.0 ],
					"saved_object_attributes" : 					{
						"autostart" : 0,
						"defer" : 0,
						"node" : "",
						"npm" : "",
						"watch" : 0
					}
,
					"text" : "node.script binance.js",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-1",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 15.0, 11.0, 286.0, 33.0 ],
					"text" : "Uses npm package found here: https://www.npmjs.com/package/node-binance-api"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-20", 0 ],
					"source" : [ "obj-10", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-33", 0 ],
					"source" : [ "obj-11", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-11", 0 ],
					"source" : [ "obj-12", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-11", 0 ],
					"source" : [ "obj-13", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-19", 0 ],
					"source" : [ "obj-15", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-22", 0 ],
					"source" : [ "obj-15", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"midpoints" : [ 727.5, 182.5, 799.0, 182.5, 799.0, 56.0, 700.5, 56.0 ],
					"source" : [ "obj-19", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-32", 1 ],
					"midpoints" : [ 24.5, 168.0, 437.0, 168.0, 437.0, 168.0, 450.5, 168.0 ],
					"order" : 1,
					"source" : [ "obj-2", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 1 ],
					"midpoints" : [ 24.5, 168.0, 575.5, 168.0 ],
					"order" : 0,
					"source" : [ "obj-2", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"midpoints" : [ 130.5, 176.25, 24.5, 176.25 ],
					"source" : [ "obj-2", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-11", 0 ],
					"midpoints" : [ 700.5, 329.0, 676.0, 329.0, 676.0, 42.0, 564.5, 42.0 ],
					"order" : 2,
					"source" : [ "obj-20", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-14", 1 ],
					"order" : 0,
					"source" : [ "obj-20", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-16", 0 ],
					"order" : 1,
					"source" : [ "obj-20", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-25", 0 ],
					"source" : [ "obj-22", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 0 ],
					"source" : [ "obj-23", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 0 ],
					"source" : [ "obj-23", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 0 ],
					"source" : [ "obj-25", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"source" : [ "obj-28", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"source" : [ "obj-3", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-29", 0 ],
					"source" : [ "obj-30", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"source" : [ "obj-31", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-32", 0 ],
					"midpoints" : [ 427.5, 236.5, 427.5, 236.5 ],
					"source" : [ "obj-31", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-30", 0 ],
					"source" : [ "obj-32", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-9", 0 ],
					"midpoints" : [ 450.5, 279.5, 503.5, 279.5 ],
					"source" : [ "obj-32", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"midpoints" : [ 560.5, 124.25, 24.5, 124.25 ],
					"source" : [ "obj-33", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-32", 0 ],
					"midpoints" : [ 571.0, 133.25, 427.5, 133.25 ],
					"source" : [ "obj-33", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"source" : [ "obj-4", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"source" : [ "obj-7", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-31", 0 ],
					"source" : [ "obj-8", 0 ]
				}

			}
 ],
		"dependency_cache" : [ 			{
				"name" : "n4m.monitor.maxpat",
				"bootpath" : "C74:/packages/Node For Max/patchers/debug-monitor",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "resize_n4m_monitor_patcher.js",
				"bootpath" : "C74:/packages/Node For Max/patchers/debug-monitor",
				"type" : "TEXT",
				"implicit" : 1
			}
 ],
		"autosave" : 0,
		"styles" : [ 			{
				"name" : "light",
				"default" : 				{
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontsize" : [ 32.0 ],
					"bgfillcolor" : 					{
						"type" : "color",
						"color1" : [ 1.0, 1.0, 1.0, 1.0 ],
						"color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"color" : [ 0.65098, 0.666667, 0.662745, 1.0 ],
						"angle" : 270.0,
						"proportion" : 0.39,
						"autogradient" : 0.0
					}

				}
,
				"parentstyle" : "",
				"multi" : 0
			}
 ]
	}

}
