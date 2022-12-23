#!/usr/bin/env bash

echo "Installing Some Developmental Toolchain"

sh -c "$(curl -fsSL https://sh.rustup.rs)" -- --no-modify-path -y
sh -c "$(curl -fsSL https://deno.land/x/install/install.sh)"
sh -c "$(curl -fsSL https://dot.net/v1/dotnet-install.sh)"
