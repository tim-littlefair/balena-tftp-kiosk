#! /usr/bin/env sh

touch /var/log/syslog
syslogd &
/usr/sbin/in.tftpd -L -c -s -p -vvv /root/tftproot &
lxterminal tail -f /var/log/syslog & 
wireshark -i eth0 &


