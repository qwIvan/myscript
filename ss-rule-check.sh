#!/bin/sh
iptables-save | grep -q ss_rules || /etc/init.d/shadowsocks-libev reload
iptables -t mangle -D ss_rules_pre_src -p udp --dport 5938 -j RETURN
iptables -t mangle -I ss_rules_pre_src -p udp --dport 5938 -j RETURN
