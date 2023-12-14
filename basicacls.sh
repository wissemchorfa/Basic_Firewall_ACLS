#!/bin/bash

# Flush existing rules
iptables -F

# Set default policies
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT

# Allow loopback traffic
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

# Allow established connections and related traffic
iptables -A INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT

# Block ICMP (ping) incoming requests
iptables -A INPUT -p icmp --icmp-type 8 -j DROP

# Block DHCP incoming requests (assuming UDP port 67)
iptables -A INPUT -p udp --dport 67 -j DROP

# Block OSPF incoming requests (adjust port number as needed)
iptables -A INPUT -p ospf -j DROP

# Block SMB incoming requests (assuming TCP port 445)
iptables -A INPUT -p tcp --dport 445 -j DROP

# Save the rules to persist across reboots
iptables-save > /etc/iptables/rules.v4

# Apply the rules immediately
iptables-restore /etc/iptables/rules.v4
