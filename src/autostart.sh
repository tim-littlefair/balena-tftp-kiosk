#! /usr/bin/env sh

syslogd
/usr/sbin/in.tftpd -L -c -s -p -v -v -v /root/tftproot &
lxterminal tail -f /var/log/syslog 
wireshark -i eth0 &


