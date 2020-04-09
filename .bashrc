# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Check winsize after each command
shopt -s checkwinsize

# aliases for common commands
alias gs='git status -s'
alias gc='git commit'
alias ga='git add'
alias gaa='git add --all'
alias gau='git add -u'
alias gd='git diff'
alias gp='git push'
alias gu='git pull'
alias gh='git checkout'
alias gl='git log'
alias gpom='git push origin master'
alias gpoc='git push origin `git rev-parse --abbrev-ref HEAD`'
alias guom='git pull origin master'
alias guoc='git pull origin `git rev-parse --abbrev-ref HEAD`'
alias dm-impulsfabrik='sudo netctl start dm-impulsfabrik'
alias dm-dialogicum='sudo netctl start dm-dialogicum'
alias smegnet='sudo netctl start smegnet'
alias dm-hotspot='sudo netctl start dmhotspot'
alias dcu='docker-compose up'
alias decrypt='curl http://mcr-configserver-01.lxdev.ka.de.dm-drogeriemarkt.com/decrypt -d '
alias encrypt='curl http://mcr-configserver-01.lxdev.ka.de.dm-drogeriemarkt.com/encrypt -d '
alias ssc='sudo systemctl'

alias ls='ls -hA --color=auto'
alias grep='grep --color'
alias egrep='egrep --color'
alias json='python -m json.tool'
alias fwlogin='fwlogin -u d0e01685 https://172.23.0.220:900/ https://172.23.0.230:900/'
alias calc='calc.sh'
alias ssh-tunnel='ssh -fND 6666 lallafa'
alias vpn="sudo vpn.sh"

alias jdk8="export JAVA_HOME=/usr/lib/jvm/java-8-jdk"
alias jdk10="export JAVA_HOME=/usr/lib/jvm/java-10-openjdk"
alias jdk11="export JAVA_HOME=/usr/lib/jvm/java-11-openjdk"
alias jdk12="export JAVA_HOME=/usr/lib/jvm/java-12-openjdk"

alias civ6="LD_PRELOAD=/usr/lib/libfreetype.so  steam steam://rungameid/28907"

# set the editor variables
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim

# idea still needs java 8
export IDEA_JDK=/usr/lib/jvm/java-8-jdk

export JAVA_OPTS="-Djavax.net.ssl.trustStore=/etc/pki/tls/certs/filiadata_extended_ca_bundle.ks -Djavax.net.ssl.trustStorePassword=changeit"
export MAVEN_OPTS="-Djavax.net.ssl.trustStore=/etc/pki/tls/certs/filiadata_extended_ca_bundle.ks -Djavax.net.ssl.trustStorePassword=changeit"

complete -c man which
complete -cf sudo

# Set the cli prompt
source /usr/share/git/completion/git-prompt.sh
#PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
GREEN="\[$(tput setaf 2)\]"
YELLOW="\[$(tput setaf 11)\]"
RED="\[$(tput setaf 9)\]"
CYAN="\[$(tput setaf 6)\]"
WHITE="\[$(tput setaf 7)\]"
MAGENTA="\[$(tput setaf 5)\]"
BLUE="\[$(tput setaf 4)\]"
BG_BLUE="\[$(tput setab 21)\]"
RESET="\[$(tput sgr0)\]"
BOLD="\[$(tput bold)\]"
BG_1="\[$(tput setab 236)\]"
BG_2="\[$(tput setab 237)\]"
BG_3="\[$(tput setab 238)\]"
FRAME_LEFT="\[$(tput setab 232)\] \[$(tput setab 233)\] \[$(tput setab 234)\] \[$(tput setab 235)\] "
FRAME_RIGHT="\[$(tput setab 235)\] \[$(tput setab 234)\] \[$(tput setab 233)\] \[$(tput setab 232)\] "

PROMPT_COMMAND=__prompt_cmd
__prompt_cmd() {
    local exitcode="$?"
    local pwd=$(pwd)
    if [ $exitcode -eq 0 ]; then
        export aux_data="${MAGENTA} H:\! ${RESET}"
    else
        export aux_data="${RED} ${BOLD}E:$exitcode ${RESET}"
    fi
    export PS1="${FRAME_LEFT}${BG_1} ${aux_data}${BG_2} ${WHITE}\t ${BG_3} ${YELLOW}${pwd}${CYAN}$(__git_ps1 " (%s)") ${RESET}${FRAME_RIGHT}\n-=# "
}

# git completion
source /usr/share/git/completion/git-completion.bash
__git_complete gp _git_push
__git_complete gh _git_checkout

# urldecoder function
function urldecode() {
    : "${*//+/ }"; echo -e "${_//%/\\x}";
}

# urlencoder function
urlencode() {
  local string="${1}"
  local strlen=${#string}
  local encoded=""
  local pos c o

  for (( pos=0 ; pos<strlen ; pos++ )); do
     c=${string:$pos:1}
     case "$c" in
        [-_.~a-zA-Z0-9] ) o="${c}" ;;
        * )               printf -v o '%%%02x' "'$c"
     esac
     encoded+="${o}"
  done
  echo "${encoded}"    # You can either set a return variable (FASTER)
}

# IRC
IRCNICK="motron"
IRCNAME="Hendrik Massup"
IRCSERVER="kornbluth.freenode.net"

# history settings
HISTSIZE=20000
HISTFILESIZE=100000
HISTCONTROL=ignoreboth
shopt -s histappend

# hosts aliases
HOSTALIASES=/etc/hosts.aliases

source /usr/local/share/crumbs/crumbs-completion.bash

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/opt/google-cloud-sdk/path.bash.inc' ]; then . '/opt/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/opt/google-cloud-sdk/completion.bash.inc' ]; then . '/opt/google-cloud-sdk/completion.bash.inc'; fi
