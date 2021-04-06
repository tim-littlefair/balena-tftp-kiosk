#! /usr/bin/env sh

nohup lxterminal /usr/sbin/in.tftpd -L -c -s -p -v -v -v /var/tftpboot &
nohup lxterminal &
nohup wireshark -i eth0 &


