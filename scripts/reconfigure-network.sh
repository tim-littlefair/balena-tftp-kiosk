# Not tested yet - but preserving as a reference for when I get time

ipaddr=$1

scp -P 22222 config/*.nmconnection root@$ipaddr:/mnt/boot/system-connections/
ssh -P 22222 root@$ipaddr rm /mnt/state/root-overlay/etc/NetworkManager/system-connections/*.nmconnection
ssh -P 22222 root@$ipaddr reboot
