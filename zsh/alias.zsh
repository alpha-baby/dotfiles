alias sudo='sudo '
alias tnew="tmux new -s"
alias ll="ls -al"
alias nv="nvim"
alias snv="sudo nvim"
alias grep='grep --color=auto -i'
# autojump config
#! /bin/sh
if [[ "$(uname)" == "Darwin" ]]; then
    # Mac OS X 操作系统
    alias vscode="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"
    # 替换 ls 命令
    which "lsd" >/dev/null 2>&1
    if [ $? -eq 0 ]; then
        alias ls="lsd"
    fi
    # 替换 rm 命令
    which "trash" >/dev/null 2>&1
    if [ $? -eq 0 ]; then
        alias rm='trash'
    else
        echo  "not found trash command, alias rm failed"
    fi
elif [[ "$(uname)" == "Linux" ]]; then
    alias ls="exa"
    alias ll="exa -alghHb --git"
fi

# proxy network
alias v2ray='export http_proxy="127.0.0.1:8001" && export https_proxy="127.0.0.1:8001" && export all_proxy="127.0.0.1:8001"'
alias nov2ray='export http_proxy="" && export https_proxy="" && export all_proxy=""'

function v2() {
    echo "start proxy\n \
    - command: $@\n \
    --------------------------------------------"
    all_proxy=socks5://127.0.0.1:1081 http_proxy=http://127.0.0.1:8001 https_proxy=http://127.0.0.1:8001 $@
}

_clash_proxy_addrs='all_proxy="socks5://127.0.0.1:7890" http_proxy="http://127.0.0.1:7890" https_proxy="http://127.0.0.1:7890"'

#alias clash='export http_proxy="127.0.0.1:7890" https_proxy="127.0.0.1:7890" all_proxy="127.0.0.1:7890"'
alias clash="export ${_clash_proxy_addrs}"
alias noclash='unset http_proxy https_proxy all_proxy'

function cl() {
    echo "start clash proxy\n \
    - command: $@\n \
    --------------------------------------------"
    all_proxy="socks5://127.0.0.1:7890" http_proxy="http://127.0.0.1:7890" https_proxy="http://127.0.0.1:7890" $@
}
# git alias config
#alias glog="git --no-pager log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --"
# alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --"
#alias git="git --no-pager"

# == kubernetes ==
# kubectl
alias k=kubectl
export KUBE_EDITOR="nvim" # 
