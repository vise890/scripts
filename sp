#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

emacs "$NOTES_DIR/__SPARKFILE.org" &
disown
