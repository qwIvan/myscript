#!/bin/sh
iptables-save | grep -q ss_rules || /etc/init.d/shadowsocks-libev reload
iptables -t mangle -D PREROUTING -p udp --dport 5938 -j RETURN
iptables -t mangle -I PREROUTING -p udp --dport 5938 -j RETURN
