#!/bin/sh
dmesg | grep 'Dropping frame due to full tx queue' && reboot
