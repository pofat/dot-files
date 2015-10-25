db="/Users/mudox/Library/Application Support/Firefox/Profiles/erhroxm5.default/places.sqlite"
open $(sqlite3 "$db" 'SELECT url FROM moz_places WHERE url NOT NULL AND url NOT LIKE ""' \
  | fzf --extended-exact)
