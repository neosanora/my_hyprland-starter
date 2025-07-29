#!/bin/bash

# Cek firewall
if sudo nft list ruleset >/dev/null 2>&1; then
  FW="🛡️"
else
  FW="❌"
fi

# Cek VPN (misal interface wg0)
if ip link show wg0 2>/dev/null | grep -q "state UP"; then
  VPN="🔒"
else
  VPN="🔓"
fi

# Cek Tor
if pgrep tor > /dev/null; then
  TOR="🧅"
else
  TOR="❌"
fi

# Mode aktif
if [[ -f /tmp/system_mode && $(cat /tmp/system_mode) == "gaming" ]]; then
  MODE="🎮"
else
  MODE="🕵️"
fi

echo "$MODE $FW $VPN $TOR"
