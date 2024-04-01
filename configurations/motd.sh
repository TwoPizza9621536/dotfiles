#!/bin/sh

. /etc/os-release

if [ -f "$HOME/.hushlogin" ]; then
  exit
fi

printf "Welcome \033[92m%s\033[0m, this is %b%s\033[0m.\n\n" \
  "$USER" "\033[m" "$HOST"

printf "If you are not %s please immediately logoff from this system.\n" \
  "$USER"

printf "%bUNAUTHORIZIED attempts to access this system is FORBIDDEN%b\n" \
  "\033[91m" "\033[0m"
printf "and may result in legal actions.\n\n"

printf "This system is running %b.\n" "\033[${ANSI_COLOR}m$PRETTY_NAME\033[0m"

printf "The local system datetime is \033[32m%s\033[0m.\n" \
  "$(date '+%Y-%m-%d %H:%M:%S %z')"
printf "The univeral datetime is \033[33m%s\033[0m.\n\n\n" \
  "$(date '+%Y-%m-%d %H:%M:%S %z')"

if [ -x "$(command -v hyfetch)" ]; then
  hyfetch
elif [ -x "$(command -v neofetch)" ]; then
  neofetch
fi

printf "All activities performed on this device are logged and monitored.\n"
