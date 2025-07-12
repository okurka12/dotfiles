#######################################################
# this file only contains my additional, custom stuff #
# paste at the end of original bashrc                 #
#######################################################

# ALIASES
if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi


# FUNCTIONS
if [ -f ~/.bash_functions ]; then
    source ~/.bash_functions
fi


# necessary for using gpg
export GPG_TTY=$(tty)

# echo "--> bashrc executed <--"
