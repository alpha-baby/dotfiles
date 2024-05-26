# auto install zi
if [[ ! -f $HOME/.zi/bin/zi.zsh ]]; then
  print -P "%F{33}▓▒░ %F{160}Installing (%F{33}z-shell/zi%F{160})…%f"
  command mkdir -p "$HOME/.zi" && command chmod go-rwX "$HOME/.zi"
  command git clone -q --depth=1 --branch "main" https://github.com/z-shell/zi "$HOME/.zi/bin" && \
    print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
    print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi
source "$HOME/.zi/bin/zi.zsh"
autoload -Uz _zi
(( ${+_comps} )) && _comps[zi]=_zi
# examples here -> https://wiki.zshell.dev/ecosystem/category/-annexes
zicompinit # <- https://wiki.zshell.dev/docs/guides/commands

# 延迟加载
zinit light romkatv/zsh-defer
# p10k oh-my-zsh主题
zinit ice depth=1; zinit light romkatv/powerlevel10k

ZSH_THEME="powerlevel10k/powerlevel10k"
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

if [[ "$(uname)" == "Darwin" ]]; then

    # macOS 操作系统
    zsh-defer -c '[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh'

elif [[ "$(uname)" == "Linux" ]]; then

    # Linux 操作系统
    echo "linux\n"
    which "brew" >/dev/null 2>&1
    if [ $? -eq 0 ]; then
        # autojump config
        zsh-defer -c '[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh'
    else
        echo "not found brew; maybe you can install it. refer: https://brew.sh"
        echo "linux homebrew doc: https://docs.brew.sh/Homebrew-on-Linux"
    fi


elif [[ "$(uname)" == "MINGW32_NT" ]]; then

    echo "windows NT"

fi


# Fast-syntax-highlighting & autosuggestions
zi wait lucid for \
 atinit"zicompinit; zicdreplay" \
    z-shell/fast-syntax-highlighting \
 atload"!_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions \
 blockf \
    zsh-users/zsh-completions

# # lib/git.zsh is loaded mostly to stay in touch with the plugin (for the users)
# # and for the themes 2 & 3 (lambda-mod-zsh-theme & lambda-gitster)
zi wait lucid for \
    zdharma-continuum/zsh-unique-id \
    OMZ::lib/git.zsh \
    OMZ::plugins/golang/golang.plugin.zsh \
 atload"unalias grv g" \
    OMZ::plugins/git/git.plugin.zsh \
    OMZP::docker

# # A few wait'3' git extensions
# zi as'null' wait'3' lucid for \
#   sbin  Fakerr/git-recall \
#   sbin  cloneopts paulirish/git-open \
#   sbin  paulirish/git-recent \
#   sbin  davidosomething/git-my \
#   sbin  iwata/git-now \
#   sbin atload'export _MENU_THEME=legacy' \
#     arzzen/git-quick-stats \
#   sbin'bin/git-dsf;bin/diff-so-fancy' \
#     z-shell/zsh-diff-so-fancy \
#   make'PREFIX=$ZPFX install' \
#     tj/git-extras
zi wait lucid for \
  Fakerr/git-recall \
  paulirish/git-open \
  paulirish/git-recent \
  davidosomething/git-my \
  make"PREFIX=$ZPFX install" iwata/git-now \
  make"PREFIX=$ZPFX" tj/git-extras

zi light paulirish/git-open

export NVM_DIR="${HOME}/.nvm"
zsh-defer -c '[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"'  # This loads nvm

export SDKMAN_DIR="/Users/fujianhao3/.sdkman"
zsh-defer -c '[[ -s "/Users/fujianhao3/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/fujianhao3/.sdkman/bin/sdkman-init.sh"'

# g shell setup
function _load_g_env() {
  if [ -f "${HOME}/.g/env" ]; then
    . "${HOME}/.g/env"
  fi
}

zsh-defer -c '_load_g_env'