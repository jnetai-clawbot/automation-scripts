#!/bin/bash
# System Health Monitor
# Monitors CPU, RAM, Disk, and Temperature

echo "=== System Health Report ==="
echo "Date: $(date)"
echo ""

# CPU Usage
echo "📊 CPU Usage:"
top -bn1 | grep "Cpu(s)" | awk '{print "   Used: " $2}'
echo ""

# RAM Usage
echo "💾 RAM Usage:"
free -h | awk '/^Mem:/ {print "   Total: " $2 "\n   Used: " $3 "\n   Free: " $4}'
echo ""

# Disk Usage
echo "💿 Disk Usage:"
df -h | awk '/^\/dev\/sda1|^dev\/sda2/ {print "   " $1 ": " $3 "/" $2 " (" $5 " used)"}'
echo ""

# Temperature (if available)
if [ -f /sys/class/thermal/thermal_zone0/temp ]; then
    TEMP=$(cat /sys/class/thermal/thermal_zone0/temp)
    TEMP_C=$((TEMP / 1000))
    echo "🌡️  Temperature: ${TEMP_C}°C"
fi

# Load Average
echo "⚖️  Load Average: $(uptime | awk -F'load average:' '{print $2}')"
