# IMPORTANT !!!
export MDX_DOT_FILES="${HOME}/Git/dot-files"

export SHELL=$0

com="${MDX_DOT_FILES}/shell"
osx="$com/osx"

# PATH manipulation functions needed by subsequent sources.
source $com/path

source $com/rvm
source $com/go_env
source $com/bin

unset com
unset osx
