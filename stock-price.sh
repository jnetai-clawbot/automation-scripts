#!/bin/bash
# Stock Price Checker
# Checks major UK and US stock prices

echo "=== Stock Prices ==="
echo "Updated: $(date)"
echo ""

# UK Stocks via Yahoo Finance
UK_STOCKS=("HSBA.L" "BP.L" "TSCO.L" "AZN.L")

echo "🇬🇧 UK Stocks:"
for stock in "${UK_STOCKS[@]}"; do
    PRICE=$(curl -s "https://query1.finance.yahoo.com/v8/finance/chart/$stock" 2>/dev/null | grep -o '"regularMarketPrice":[0-9.]*' | head -1 | cut -d':' -f2)
    if [ -n "$PRICE" ]; then
        echo "   $stock: £$PRICE"
    fi
done
echo ""

# US Stocks
US_STOCKS=("AAPL" "GOOGL" "MSFT" "NVDA" "TSLA")

echo "🇺🇸 US Stocks:"
for stock in "${US_STOCKS[@]}"; do
    PRICE=$(curl -s "https://query1.finance.yahoo.com/v8/finance/chart/$stock" 2>/dev/null | grep -o '"regularMarketPrice":[0-9.]*' | head -1 | cut -d':' -f2)
    if [ -n "$PRICE" ]; then
        echo "   $stock: \$$PRICE"
    fi
done
