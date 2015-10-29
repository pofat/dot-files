#!/usr/bin/env bash
#cmdhub: Compile Neovim from repo & install it to ~/.bin/neovim

# backup original neovim version
neovim_path="$HOME/.bin/neovim"

if [[ -d $neovim_path ]]; then
  rm -rf "${neovim_path}.tmp"
  mv -T "$neovim_path" "${neovim_path}.tmp" || exit
fi

cd ~/Git/neovim || exit 1
rm -r build &>/dev/null
make clean
make CMAKE_BUILD_TYPE=Release CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX:PATH=$HOME/.bin/neovim" install
