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


# create AES256 encrypted archive using common tools (tar, gpg)
gpgencrypt () {

    # help text
    if [ "$1" = "--help" ]; then
        echo "Usage: gpgencrypt ARCHIVENAME FILES"
        return
    fi

    # safety check
    if [ -f "$1" ]; then
        echo -n "first argument of gpgencrypt should be the archive name! "
        echo    "stopping"
        return
    fi

    # create archive name
    local ARCHIVENAME="$1"
    if [[ "$ARCHIVENAME" != *.tar.gz.gpg ]]; then
        ARCHIVENAME="$ARCHIVENAME.tar.gz.gpg"
    fi

    # do not overwrite existing archive
    if [ -f "$ARCHIVENAME" ]; then
        echo "$ARCHIVENAME already exists, aborting"
        return
    fi

    # file list
    local FILES="${@:2}"

    # archive and encrypt
    tar -czv $FILES | gpg -c --cipher-algo AES256 --batch -z 0 -o "$ARCHIVENAME"

    echo "Files encrypted and saved to $ARCHIVENAME"
}


# decrypt archive created by gpgencrypt
gpgdecrypt () {
    local ARCHIVENAME=${1%.*}
    cat $1 | gpg -d > "$ARCHIVENAME"
}


# necessary for using gpg
export GPG_TTY=$(tty)

# echo "--> bashrc executed <--"
