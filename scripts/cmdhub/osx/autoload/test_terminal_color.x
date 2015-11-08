#/usr/bin/env bash
# cmdhub: Test terminal emulator's color capability
#
#   This file echoes a bunch of color codes to the
#   terminal to demonstrate what's available.  Each
#   line is the color code of one foreground color,
#   out of 17 (default + 16 escapes), followed by a
#   test use of that color on all nine background
#   colors (default + 8 escapes).
#

CELL_TEXT='Mudox'   # The test text
#CELL_TEXT='gYw'   # The test text
CELL_WIDTH=${#CELL_TEXT}
HEAD_WIDTH=7

FGs=(30m 31m 32m 33m 34m 35m 36m 37m)
BGs=(40m 41m 42m 43m 44m 45m 46m 47m)


printf "\n%${HEAD_WIDTH}s" ' '
for bg in "${BGs[*]}"; do
  printf "  %${CELL_WIDTH}s " $bg
done
echo

color_line() {
  local fg=$1
  printf "\n%${HEAD_WIDTH}s" $fg
  for bg in "${BGs[@]}"; do
    printf " \x1b[${fg}\x1b[${bg} %${CELL_WIDTH}s \x1b[0m" "${CELL_TEXT}"
  done
}

for fg in "${FGs[@]}"; do
  color_line ${fg}
  fg_bold="1;${fg}"
  color_line ${fg_bold}
  fg_bold_blink="5;${fg_bold}"
  color_line ${fg_bold_blink}
  fg_bold_inverse="7;${fg_bold}"
  color_line ${fg_bold_inverse}
  echo
done
echo

# vim: ft=sh
