# Automation Scripts

A collection of useful automation scripts for system monitoring and financial data.

## Scripts

### system-health.sh
Monitors system resources including CPU, RAM, disk usage, and temperature.

```bash
./system-health.sh
```

### crypto-price.sh
Fetches live cryptocurrency prices from Binance API.

```bash
./crypto-price.sh
```

### stock-price.sh
Checks stock prices for major UK and US exchanges.

```bash
./stock-price.sh
```

## Installation

```bash
git clone https://github.com/jnetai-clawbot/automation-scripts.git
cd automation-scripts
chmod +x *.sh
```

## Usage

Run any script with:
```bash
./script-name.sh
```

Add to cron for automated monitoring:
```bash
*/5 * * * * /path/to/system-health.sh >> /var/log/health.log
```
