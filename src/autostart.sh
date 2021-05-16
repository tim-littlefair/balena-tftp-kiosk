#! /usr/bin/env sh

wireshark -i eth0 -i wlan0  -k &
xterm -T syslog -e tail -f /var/log/syslog & 
xterm -T syslog2 -e logread -f & 
rxvt &



