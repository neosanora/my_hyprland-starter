#!/bin/bash

MODE_FILE="/tmp/system_mode"

if [[ -f "$MODE_FILE" && $(cat "$MODE_FILE") == "gaming" ]]; then
  echo "privacy" > "$MODE_FILE"
  notify-send "Waybar Mode" "🕵️ Privacy Mode aktif"
  sudo nft flush ruleset
  sudo nft -f /etc/nftables.conf
else
  echo "gaming" > "$MODE_FILE"
  notify-send "Waybar Mode" "🎮 Gaming Mode aktif"
  sudo nft flush ruleset
  # atau load rules ringan, misal /etc/nftables-gaming.conf
fi
