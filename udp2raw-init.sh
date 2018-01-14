#!/bin/sh
while true
do
/root/udp2raw_mips24kc_le_asm_aes -c -l 0.0.0.0:6077 -r 103.82.5.185:4096  -a --cipher-mode xor  --auth-mode simple --log-level 0
sleep 1
done
