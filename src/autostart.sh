#! /usr/bin/env sh

wireshark -i eth0 -i wlan0  -k &
lxterminal -e tail -f /var/log/syslog & 


