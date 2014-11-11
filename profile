# vim: filetype=zsh

# IMPORTANT !!!
export MDX_DOT_FILES="${HOME}/Git/dot-files"

com="${MDX_DOT_FILES}/shell"
archlinux="$com/archlinux"

# PATH manipulation functions needed by subsequent sources.
source "$com/path"

case $(uname -s) in
  Darwin )
    # for MacOS
    ;;
  CYGWIN* )
    # for Cygwin on Windows
    ;;
  Linux )
    case $(uname -r) in
      *ARCH )
	source "${archlinux}/vpn_dns"
	;;
    esac
    ;;
  * )
    echo "\e[31m[.zshrc]: un-recognized platform."
    ;;
esac



source "${com}/go_env"
source "${com}/bin"
source "${com}/rvm"

mdx_uniq_path

unset com
unset archlinux
