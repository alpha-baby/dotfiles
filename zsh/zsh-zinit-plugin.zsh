# 语法高亮
# zinit ice lucid wait='0' atinit='zpcompinit'
# zinit light zdharma/fast-syntax-highlighting

# 自动建议
# zinit ice lucid wait="0" atload='_zsh_autosuggest_start'
# zinit light zsh-users/zsh-autosuggestions

# git-open 插件
# zinit ice lucid wait="0"
# zinit light paulirish/git-open 
    
# 补全
# zinit ice lucid wait='0'
# zinit light zsh-users/zsh-completions
# zstyle ':completion:*:complete:*' cache-path "${HOME}/.zcompdump"
#
# 延迟加载
zinit light romkatv/zsh-defer
# p10k oh-my-zsh主题
zinit ice depth=1; zinit light romkatv/powerlevel10k

ZSH_THEME="powerlevel10k/powerlevel10k"
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# autojump config
#! /bin/sh
if [[ "$(uname)" == "Darwin" ]]; then

    # macOS 操作系统
    zsh-defer -c '[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh'


elif [[ "$(uname)" == "Linux" ]]; then

    # Linux 操作系统
    zsh-defer -c '[[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && . ~/.autojump/etc/profile.d/autojump.sh'

elif [[ "$(uname)" == "MINGW32_NT" ]]; then

    echo "windows NT"

fi


# Fast-syntax-highlighting & autosuggestions
zinit wait lucid for \
 atinit"ZINIT[COMPINIT_OPTS]=-C; zpcompinit; zpcdreplay" \
    zdharma/fast-syntax-highlighting \
 atload"!_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions \
 blockf \
    zsh-users/zsh-completions

# lib/git.zsh is loaded mostly to stay in touch with the plugin (for the users)
# and for the themes 2 & 3 (lambda-mod-zsh-theme & lambda-gitster)
zinit wait lucid for \
    zdharma/zsh-unique-id \
    OMZ::lib/git.zsh \
    OMZ::plugins/golang/golang.plugin.zsh \
 atload"unalias grv g" \
    OMZ::plugins/git/git.plugin.zsh

# A few wait'3' git extensions
zinit as"null" wait"3" lucid for \
    sbin Fakerr/git-recall \
    sbin paulirish/git-open \
    sbin paulirish/git-recent \
    sbin davidosomething/git-my \
    sbin atload"export _MENU_THEME=legacy" \
        arzzen/git-quick-stats \
    sbin iwata/git-now \
    make"PREFIX=$ZPFX"         tj/git-extras \
    sbin"bin/git-dsf;bin/diff-so-fancy" zdharma/zsh-diff-so-fancy \
    sbin"git-url;git-guclone" make"GITURL_NO_CGITURL=1" zdharma/git-url

# fzf, fzy
zinit pack"bgn-binary" for fzf
zinit pack"bgn" for fzy



export NVM_DIR="${HOME}/.nvm"
zsh-defer -c '[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"'  # This loads nvm

export SDKMAN_DIR="/Users/fujianhao3/.sdkman"
zsh-defer -c '[[ -s "/Users/fujianhao3/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/fujianhao3/.sdkman/bin/sdkman-init.sh"'