#!/bin/sh

export UBOOT_COMMAND

while true
do
    minicom -S sample.minicom-script
    sleep 2
done
