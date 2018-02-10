#!/bin/sh
dmesg | grep 'Dropping frame due to full tx queue' && ! [ $(nc 192.168.1.101 8090) = '1' ] && date >> /root/reboot.log && reboot
