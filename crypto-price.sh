#!/bin/bash
# Crypto Price Fetcher
# Fetches BTC, ETH, and other crypto prices

COINS=("BTCUSDT" "ETHUSDT" "SOLUSDT" "DOGEUSDT")

echo "=== Crypto Prices ==="
echo "Updated: $(date)"
echo ""

for coin in "${COINS[@]}"; do
    PRICE=$(curl -s "https://api.binance.com/api/v3/ticker/price?symbol=$coin" 2>/dev/null | grep -o '"price":"[^"]*"' | cut -d'"' -f4)
    if [ -n "$PRICE" ]; then
        SYMBOL=$(echo $coin | sed 's/USDT//')
        printf "%-8s \$%s\n" "$SYMBOL:" "$PRICE"
    else
        echo "$coin: Unable to fetch"
    fi
done
