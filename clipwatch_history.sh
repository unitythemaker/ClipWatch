#!/bin/bash
CW_PATH="${CW_PATH:-$HOME/.local/share/clipwatch}"

RED='\033[0;31m'
NC='\033[0m'

n=1
while read line; do
  echo -ne "${RED}$n: ${NC}"
  echo "$(echo $line | base64 -d)"
n=$((n+1))
done < "$CW_PATH/history"
