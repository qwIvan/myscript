#!/bin/sh
dmesg | grep 'Dropping frame due to full tx queue' && date >> /root/reboot.log && reboot
