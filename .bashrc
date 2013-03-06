#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


# some aliases for often used commands and typos
alias ls='ls --color=auto -hA'
alias pacman='pacman-color'
alias pamcan='pacman'
alias st='git status -s'
alias push='git push origin master'
alias mvnnt='mvn -DskipITs -DskipTests -Dmaven.test.skip=true'

# export some variables for various programs
export PATH=${PATH}:/home/ruckus/scripts
export EDITOR=/usr/bin/vim
export HISTSIZE=5000
export IRCNICK="fasseg"
export IRCNAME="Six by nine. Forty-two."
export MAVEN_OPTS="-XX:MaxPermSize=256m -Xmx1024m"

# add command completion for sudo and man
complete -cf sudo
complete -cf man

# cd into a directory by just typing a path
shopt -s autocd

# set the editor variables
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim

# add git completion and the git prompt
source /usr/share/git/completion/git-completion.bash
source /usr/share/git/git-prompt.sh

# set the dircolors
eval $(dircolors -b)

# git
#if [ -f `brew --prefix`/etc/bash_completion.d/git-completion.bash ]; then
#. `brew --prefix`/etc/bash_completion.d/git-completion.bash
#fi
export GIT_PS1_SHOWDIRTYSTATE=1

# prompt
#export PS1='\u@\h \[\e[0;32m\]\W\[\e[0m\]$(__git_ps1 " (%s)")\$ '
export PS1='\[\e[1;32m\][\u@\h \W$(__git_ps1 " (%s)")]\[\e[0m\] '
