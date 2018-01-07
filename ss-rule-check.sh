#!/bin/sh
iptables-save | grep -q ss_rules || /etc/init.d/shadowsocks-libev reload
