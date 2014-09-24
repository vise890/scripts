#!/bin/bash
# bash "strict mode" : http://redsymbol.net/articles/unofficial-bash-strict-mode
set -euo pipefail
IFS=$'\n\t'

cd $ORGPATH/todo

cat todo* | uniq | sort > todo.txt

rm todo\ \(conflicted*
