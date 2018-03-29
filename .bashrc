# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# aliases for common commands
alias st='git status -s'
alias ls='ls -hA --color=auto'
alias grep='grep --color'
alias json='python -m json.tool'
alias fwlogin='fwlogin -u d0e01685 https://172.23.0.220:900/ https://172.23.0.230:900/'

# set the editor variables
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim

# set the java home
export JAVA_HOME=/usr/lib/jvm/java-8-jdk

complete -c man which
complete -cf sudo

# Set the cli prompt
source /usr/share/git/completion/git-prompt.sh
#PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
GREEN="\[$(tput setaf 2)\]"
YELLOW="\[$(tput setaf 11)\]"
RED="\[$(tput setaf 9)\]"
CYAN="\[$(tput setaf 6)\]"
RESET="\[$(tput sgr0)\]"
PROMPT_COMMAND=__prompt_cmd
__prompt_cmd() {
    local exitcode="$?"
    if [ $exitcode -eq 0 ]; then
        export PS1="[${YELLOW}\W${CYAN}$(__git_ps1 " (%s)")${RESET}] "
    else
        export PS1="[${YELLOW}\W${CYAN}$(__git_ps1 " (%s)") ${RED}E:$exitcode${RESET}] "
    fi
}

# git completion
source /usr/share/git/completion/git-completion.bash
