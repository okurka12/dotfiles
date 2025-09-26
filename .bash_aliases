alias ll='ls -l'
alias la='ls -A'
alias llh="ls -l -h"

alias grep='grep --color=auto'

alias s='source'
alias ..='cd ..'
alias gits='git status'
alias gitc="git commit"
alias gitp="git push"
alias gita='git add'
alias gitcm='git commit -m'
alias gitp='git push'
alias py=python3.13
alias py12=python3.12
alias vgall="valgrind -s --leak-check=full --show-leak-kinds=all --track-origins=yes --track-fds=yes --num-callers=60"
alias lnhelp="echo ln -s TARGET LINK_NAME"

alias viewkeys='cat "$HOME/.ssh/authorized_keys"'
alias editkeys='nano "$HOME/.ssh/authorized_keys"'

# apt (sapt stands for 'sudo apt')
alias saptins='sudo apt install'
alias saptupd='sudo apt update'
alias saptlis='sudo apt list --upgradable'
alias saptupg='sudo apt upgrade'
alias saptupall='sudo apt update && sudo apt list --upgradable && echo "upgrading in 5 seconds..." && sleep 5 && sudo apt upgrade'

# use for updating aliases and functions
alias updatedotfiles='curl https://raw.githubusercontent.com/okurka12/dotfiles/refs/heads/main/install-bash.sh > deleteme.sh && chmod +x deleteme.sh && ./deleteme.sh && rm -v deleteme.sh && source ~/.bashrc'

alias forcereboot="sudo systemctl reboot --force"

# *nix/windows
alias dir=ls
alias where=whereis
alias ipconfig='ip -c addr'
alias cls=clear

# ncdu 1.18 on debian 12 used this by default
# but ncdu 1.22 on debian 13 doesn't
alias ncdu='ncdu --color dark-bg'

# exit
alias ee=exit
alias schluss=exit
alias ende=exit
alias ausgang=exit
alias endung=exit
alias finito=exit
alias goodbye=exit
alias finis=exit
alias adios=exit
alias ciao=exit
alias konec=exit
alias skonči=exit
alias ukonči=exit
alias ukončit=exit
alias sbohem=exit

# python venv
alias svenv='source ./venv/bin/activate'
