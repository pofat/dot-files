# cmdhub: Show new Neovim commits since the installed version

cd ~/Git/neovim/ || exit 1
echo 'git pull ...'
gl
lg $(nvim -v | sed -n '1p' | cut -c 18-26)..HEAD

# vim: ft=sh
