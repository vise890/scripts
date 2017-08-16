#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

gpg --default-recipient-self -e ~/.lein/credentials.clj > ~/.lein/credentials.clj.gpg
rm ~/.lein/credentials.clj
