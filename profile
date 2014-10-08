# IMPORTANT !!!
export MDX_DOT_FILES="${HOME}/Git/dot-files"

com="${MDX_DOT_FILES}/shell"

# PATH manipulation functions needed by subsequent sources.
source $com/path

source ${com}/go_env
source ${com}/bin
source ${com}/rvm

mdx_uniq_path

unset com
