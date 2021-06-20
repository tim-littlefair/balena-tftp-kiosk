# /bin/sh
# add_static_address.sh
#
# Script to modify the network configuration of a Balena host installation
# to select a fixed IP address even on a DHCP network
#
# Note that this script is designed to be run from the workstation controlling
# the balena process, not from the host or container on the RPi device
#
# Based on advice gleaned from
# https://askubuntu.com/questions/1186636/how-to-configure-a-fallback-static-ip-address-when-there-is-no-dhcp-server-prese
# https://opensource.com/article/20/7/nmcli

if [ -z "$1" -o -z "$2" -o -z "$3" ]
then
    echo Usage: $0 [dhcp_address] [static_address] [subnet_prefix_bits]
fi

export TARGET_DHCP_ADDRESS=$1
export TFTP_KIOSK_STATIC_ADDRESS=$2
export TFTP_KIOSK_SUBNET_PREFIX_BITS=$3

if [ -z "$TFTP_KIOSK_STATIC_ADDRESS" ]
then
    # No need for a static address, just exit
    exit 0
fi

export TFTP_KIOSK_STATIC_ADDRESS

if [ -z "$TFTP_KIOSK_SUBNET_PREFIX_BITS" ]
then
    export TFTP_KIOSK_SUBNET_PREFIX_BITS=8
fi

# Push the priority down for the default connection
WC1="Wired connection 1"

# Create a new connection with higher priority, binding to eth0
balena ssh $TARGET_DHCP_ADDRESS <<+
nmcli connection modify "$WC1" \
    ip4 $TFTP_KIOSK_STATIC_ADDRESS/$TFTP_KIOSK_SUBNET_PREFIX_BITS 

nmcli con reload
+
