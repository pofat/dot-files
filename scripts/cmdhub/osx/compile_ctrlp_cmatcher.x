#!/usr/bin/env bash
# cmdhub: Compile 'ctrlp-cmatcher' plugin

cd "${MDX_REPOS_ROOT}/vim-config/plugged/ctrlp_cmatcher" && \
CFLAGS=-Qunused-arguments CPPFLAGS=-Qunused-arguments ./install.sh
