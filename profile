# vim: filetype=zsh

# IMPORTANT !!!
export MDX_REPOS_ROOT="${HOME}/Git"
export MDX_DOT_FILES="${MDX_REPOS_ROOT}/dot-files"

com="${MDX_DOT_FILES}/shell"
archlinux="$com/archlinux"

# PATH manipulation functions needed by subsequent sources.
source "${com}/path"

source "${com}/go_env"
source "${com}/bin"
source "${com}/rvm"

case $(uname -s) in
  Darwin )
    # for MacOS
    ;;
  CYGWIN* )
    # for Cygwin on Windows
    ;;
  Linux )
    # for Linux
    source "${archlinux}/pyenv"
    ;;
  * )
    printf "\e[31m[.zshrc]: un-recognized platform.\e[0m\n"
    ;;
esac


mdx_uniq_path

unset com
unset archlinux
