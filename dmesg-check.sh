#!/bin/sh
dmesg | grep 'Dropping frame due to full tx queue' && ! [ $(nc 192.168.1.101 8090) = '1' ] && date >> /root/reboot.log && reboot
# 其实在Wi-Fi出问题的时候，无法通过nc来判断电视是否打开，因此nc那一段可以删掉
# dmesg | grep 'Dropping frame due to full tx queue' && date >> /root/reboot.log && reboot
