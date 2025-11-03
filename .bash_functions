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
    if [ "$1" = "--help" -o "$1" = "" ]; then
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

    if [ "$1" = "" ]; then
        echo "Usage: gpgdecrypt ARCHIVE"
        return
    fi

    local ARCHIVENAME=${1%.*}

    if [ -f "$ARCHIVENAME" ]; then
        echo "$ARCHIVENAME exists, aborting"
        return
    fi

    cat $1 | gpg -d > "$ARCHIVENAME"
    echo "$ARCHIVENAME"
}


# shred -u recursively on directories
shredall () {

    # this way it works for filenames with spaces
    find $@ | while read FILE; do
        if [ -f "$FILE" ]; then
            echo "$FILE"
            shred -u "$FILE"
        fi
    done
}

# like id(1) but for groups
gid () {

    if [ "$1" = "" ]; then
        echo "usage: gid GROUPNAME" >&2
        return
    fi

    local COUNT=$(grep -c "$1" /etc/group)
    if [ "$COUNT" = "0" ]; then
        echo "gid: ‘$1’: no such group" >&2
        return
    fi

    getent group "$1" | cut -d: -f3
}

# random characters
randomchars () {
    if [ -e /dev/urandom ]; then
        local DEVICE=/dev/urandom
    else
        local DEVICE=/dev/random
    fi

    if [ "$1" = "" ]; then
        local COUNT=64
    else
        local COUNT="$1"
    fi

    cat $DEVICE | tr -dc "[:print:]" | head -c $COUNT
    echo ""
}
