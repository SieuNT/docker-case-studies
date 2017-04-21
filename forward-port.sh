#!/bin/sh

iptables -F
iptables -t nat -F
iptables -X

iptables -t nat -A PREROUTING -p tcp --dport $2 -j DNAT --to-destination $1:$2
iptables -t nat -A POSTROUTING -p tcp -d $1 --dport $2 -j SNAT --to-source $1