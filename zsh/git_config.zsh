function _config_git() {
    # git 中文字符
    git config --global core.quotepath false
    # git  pull 规则
    git config --global pull.rebase false
    # 使用neovim 为git默认编辑器
    export GIT_EDITOR=nvim
}

# 延迟加载, 加速 zsh 启动时间
zsh-defer -c '_config_git'