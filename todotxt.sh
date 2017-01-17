#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

export global_todotxt="$TODO_DIR/todo.txt"
export global_donetxt="$TODO_DIR/done.txt"
export global_somedaytxt="$TODO_DIR/someday.txt"

cwd_todotxt="$(pwd)/todo.txt"
if [ -e "$cwd_todotxt" ]; then
  cwd_donetxt="$(pwd)/done.txt"
  cwd_somedaytxt="$(pwd)/someday.txt"
  todotxt=$cwd_todotxt
  donetxt=$cwd_donetxt
  somedaytxt=$cwd_somedaytxt
else
  todotxt=$global_todotxt
  donetxt=$global_donetxt
  somedaytxt=$global_somedaytxt
fi;


function archive_someday {
  grep '@someday' "$todotxt" >> "$somedaytxt"
  sed -i '/@someday/d' "$todotxt"
}

# needle -> IO ()
function grep_todotxt {
  ag --numbers $1 $todotxt
}

function ls_contexts {
  ag --no-numbers --only-matching '@\w+' $todotxt | sort --unique
}

function show_inbox {
  ag --invert-match --numbers '@\w+' $todotxt
}


