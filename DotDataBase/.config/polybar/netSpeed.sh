#!/bin/sh
time=1

down=$(($(cat /sys/class/net/*/statistics/rx_bytes | paste -sd '+')))
up=$(($(cat /sys/class/net/*/statistics/tx_bytes | paste -sd '+')))

sleep $time

newDown=$(($(cat /sys/class/net/*/statistics/rx_bytes | paste -sd '+')))
newUp=$(($(cat /sys/class/net/*/statistics/tx_bytes | paste -sd '+')))

upSpeed=$(numfmt --to=iec $((newUp-up)))
downSpeed=$(numfmt --to=iec $((newDown-down)))

if [ "$1" = "up" ]; then
    echo $upSpeed
elif [ "$1" = "down" ];then
    echo $downSpeed
fi
