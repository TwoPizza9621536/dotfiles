#!/usr/bin/sh
# From https://stackoverflow.com/a/72268829
path="$1"
fixed_length=$2

if (( ${#path} > $fixed_length )); then
    path=$(echo "$path" | tail -c "$fixed_length")
    if ! [[ "$path" =~ ^//* ]]; then
        path="/${path#*/}"
    fi
    path="...$path"
fi
echo $path
