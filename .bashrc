#
# this file only contains my additional, custom stuff
#

# ALIASES
# aliases are stored in a separate dotfile, which I have as a gist
# see https://gist.github.com/okurka12/cc3769db8e6f57dfdf091428095b7e00
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi


# command to change directory to a diractory that doesnt exist yet
cdd () {
    if [ ! -d "$1" ]; then
        mkdir -p -- "$1"
    fi
    cd -- "$1"
}

# with this, you can sign commits easily every time
export GPG_TTY=$(tty)

# echo "--> bashrc executed <--"
