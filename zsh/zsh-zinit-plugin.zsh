# 语法高亮
zinit ice lucid wait='0' atinit='zpcompinit'
zinit light zdharma/fast-syntax-highlighting

# 自动建议
zinit ice lucid wait="0" atload='_zsh_autosuggest_start'
zinit light zsh-users/zsh-autosuggestions

# git-open 插件
zinit as"null" wait"1" lucid for \
    sbin    cloneopts paulirish/git-open 
    
# 补全
zinit ice lucid wait='0'
zinit light zsh-users/zsh-completions
zstyle ':completion:*:complete:*' cache-path "${HOME}/.zcompdump"
#
# p10k oh-my-zsh主题
zinit ice depth=1; zinit light romkatv/powerlevel10k

ZSH_THEME="powerlevel10k/powerlevel10k"
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# autojump config
#! /bin/sh
if [ "$(uname)" == "Darwin" ]; then

    # macOS 操作系统
    [[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh


elif [ "$(uname)" == "Linux" ]; then

    # Linux 操作系统
    [[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && . ~/.autojump/etc/profile.d/autojump.sh  

elif [ "$(uname)" == "MINGW32_NT" ]; then

    echo "windows NT"

fi
