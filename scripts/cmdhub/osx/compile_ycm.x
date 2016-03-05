#!/usr/bin/env bash
# cmdhub: Compile YCM

cd "${MDX_REPOS_ROOT}/vim-config/plugged/ycm" && \
./install.py --clang-completer --gocode-completer
