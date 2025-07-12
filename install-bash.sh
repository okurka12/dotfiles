#!/bin/bash

# one-liner:
# curl https://raw.githubusercontent.com/okurka12/dotfiles/refs/heads/main/install-bash.sh > deleteme.sh && chmod +x deleteme.sh && ./deleteme.sh && rm -v deleteme.sh && source ~/.bashrc
#
# brief:
# This script lets you install aliases and functions with one command (see
# above). Previous versions of .bashrc/aliases/functions are kept, you can
# manually delete them later with the command below (make sure you don't need
# them)
#
# update:
# also installs nanorc
#
# remove old:
# rm -v .bashrc-old-* .bash_functions-old-* .bash_aliases-old-* .nanorc-old-*
#
REPO_URL=https://raw.githubusercontent.com/okurka12/dotfiles/refs/heads/main

save_old () {
    if [ -f "$1" ]; then
        echo "preserving old $1"
        local DATE=$(date +%Y%m%d%H%M%S)
        cp "$1" "$1-old-$DATE"
    fi
}

GO_BACK_TO=$(pwd)
cd "$HOME" || exit

save_old .bash_aliases
save_old .bash_functions
save_old .bashrc
save_old .nanorc

curl -O $REPO_URL/.bash_aliases
curl -O $REPO_URL/.bash_functions
curl -O $REPO_URL/.nanorc
curl $REPO_URL/.bashrc >> .bashrc

echo "aliases and functions installed"

cd "$GO_BACK_TO" || exit
