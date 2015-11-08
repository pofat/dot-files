# cmdhub: Show new Neovim commits since the installed version

cd ~/Git/neovim/ || exit 1
echo 'git pull ...'
gl
lg $(nvim -v | sed -n '2p' | cut -c 9-16)..HEAD

# vim: ft=sh
