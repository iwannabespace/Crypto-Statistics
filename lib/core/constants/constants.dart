const apiUrl = 'https://api.coincap.io/v2/assets';

const symbols = [
  "BTC",
  "ETH",
  "USDT",
  "BNB",
  "USDC",
  "XRP",
  "SOL",
  "ADA",
  "DOGE",
  "TRX",
  "DAI",
  "DOT",
  "MATIC",
  "LTC",
  "WBTC",
  "BCH",
  "SHIB",
  "LINK",
  "LEO",
  "AVAX",
  "TUSD",
  "XLM",
  "XMR",
  "OKB",
  "UNI",
  "BUSD",
  "ETC",
  "ATOM",
  "BTCB",
  "FIL",
  "LDO",
  "MKR",
  "ICP",
  "CRO",
  "VET",
  "QNT",
  "NEAR",
  "AAVE",
  "ALGO",
  "GRT",
  "STX",
  "HBAR",
  "XTZ",
  "RNDR",
  "BSV",
  "AXS",
  "EOS",
  "SAND",
  "THETA",
  "XDC",
  "RUNE",
  "EGLD",
  "INJ",
  "MANA",
  "FTM",
  "KAVA",
  "USDP",
  "NEO",
  "XEC",
  "SNX",
  "FLOW",
  "ZEC",
  "KCS",
  "CHZ",
  "FEI",
  "IOTA",
  "TWT",
  "OCEAN",
  "CFX",
  "FXS",
  "RPL",
  "CRV",
  "KLAY",
  "HT",
  "DYDX",
  "MINA",
  "CSPR",
  "GT",
  "FTT",
  "GALA",
  "COMP",
  "DASH",
  "WOO",
  "NEXO",
  "ZIL",
  "ROSE",
  "AR",
  "BAT",
  "CAKE",
  "1INCH",
  "GNO",
  "LOOM",
  "LRC",
  "XEM",
  "QTUM",
  "CVX",
  "ELF",
  "ENJ",
  "CELO",
  "MASK"
];
const ids = [
  "bitcoin",
  "ethereum",
  "tether",
  "binance-coin",
  "usd-coin",
  "xrp",
  "solana",
  "cardano",
  "dogecoin",
  "tron",
  "multi-collateral-dai",
  "polkadot",
  "polygon",
  "litecoin",
  "wrapped-bitcoin",
  "bitcoin-cash",
  "shiba-inu",
  "chainlink",
  "unus-sed-leo",
  "trueusd",
  "avalanche",
  "stellar",
  "monero",
  "okb",
  "uniswap",
  "binance-usd",
  "ethereum-classic",
  "cosmos",
  "bitcoin-bep2",
  "filecoin",
  "lido-dao",
  "maker",
  "internet-computer",
  "crypto-com-coin",
  "vechain",
  "quant",
  "near-protocol",
  "aave",
  "algorand",
  "the-graph",
  "stacks",
  "hedera-hashgraph",
  "render-token",
  "tezos",
  "bitcoin-sv",
  "axie-infinity",
  "eos",
  "theta",
  "the-sandbox",
  "thorchain",
  "elrond-egld",
  "injective-protocol",
  "xinfin-network",
  "decentraland",
  "fantom",
  "kava",
  "paxos-standard",
  "neo",
  "ecash",
  "fei-protocol",
  "synthetix-network-token",
  "flow",
  "zcash",
  "kucoin-token",
  "chiliz",
  "iota",
  "trust-wallet-token",
  "ocean-protocol",
  "frax-share",
  "conflux-network",
  "curve-dao-token",
  "rocket-pool",
  "klaytn",
  "huobi-token",
  "mina",
  "dydx",
  "casper",
  "gatetoken",
  "ftx-token",
  "gala",
  "compound",
  "dash",
  "wootrade",
  "nexo",
  "zilliqa",
  "oasis-network",
  "arweave",
  "basic-attention-token",
  "pancakeswap",
  "1inch",
  "gnosis-gno",
  "loom-network",
  "nem",
  "loopring",
  "qtum",
  "aelf",
  "enjin-coin",
  "celo",
  "mask-network",
  "singularitynet"
];
