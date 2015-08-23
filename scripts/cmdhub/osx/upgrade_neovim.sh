cd ~/Git/neovim || exit 1
rm -r build &>/dev/null
make clean
make CMAKE_BUILD_TYPE=Release CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX:PATH=$HOME/.bin/neovim" install
cd -
