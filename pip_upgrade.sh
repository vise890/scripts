pip list --user --outdated --format json | jq --raw-output '.[].name' | xargs pip install --user --upgrade
