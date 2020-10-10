alias sudo='sudo '
alias tnew="tmux new -s"
alias ls="colorls"
alias ll="ls -al"
alias nv="nvim"
alias snv="sudo nvim"
alias vscode="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"
alias rm='rmtrash'
alias grep='grep --color=auto -in'


# proxy network
alias v2ray='export http_proxy="127.0.0.1:8001" && export https_proxy="127.0.0.1:8001" && export all_proxy="127.0.0.1:8001"'
alias nov2ray='export http_proxy="" && export https_proxy="" && export all_proxy=""'

function v2() {
    echo "start proxy\n \
    - command: $@\n \
    --------------------------------------------"
    all_proxy=socks5://127.0.0.1:1081 http_proxy=http://127.0.0.1:8001 https_proxy=http://127.0.0.1:8001 $@
}

# git alias config
#alias glog="git --no-pager log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --"
alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --"
#alias git="git --no-pager"

# == kubernetes ==
# kubectl
alias k=kubectl