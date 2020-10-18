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
if["$(uname)"=="Darwin"];then
# Mac OS X 操作系统
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh
elif["$(expr substr $(uname -s) 1 5)"=="Linux"];then 
[[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && . ~/.autojump/etc/profile.d/autojump.sh  
# GNU/Linux操作系统
elif["$(expr substr $(uname -s) 1 10)"=="MINGW32_NT"];then    
# Windows NT操作系统
fi

