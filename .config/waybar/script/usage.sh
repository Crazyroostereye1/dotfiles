current=$(cat /sys/class/power_supply/BAT1/current_now)
voltage=$(cat /sys/class/power_supply/BAT1/voltage_now)

echo "$(($voltage * $current / 1000000000000))"
