au! BufEnter ~/Git/dot-files/tmux/sessions/[^.]* let b:tit_keys= 'bash ' . shellescape(bufname('%'))
let g:tit_target = '.2'
