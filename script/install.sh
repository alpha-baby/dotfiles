which "git" >/dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "not found git, please install it"
    exit 3
fi

_new_version=`git -C ${HOME}/dotfiles rev-parse HEAD`
_installed_version=""
if [[ -f "$HOME"/dotfiles/script/.installed_version ]]; then
    _installed_version=`cat ${HOME}/dotfiles/script/.installed_version`
fi

if [[ "$_new_version" = "$_installed_version" ]]; then
    return
fi

# common install or setpu config files

# ------------------
# --- yazi ---------
# ------------------
__intall_yazi() {
    which "yazi" >/dev/null 2>&1
    if [ $? -eq 0 ]; then
        ya pack -u
        echo "success upgrade yazi plugins!!!"
    else
        echo "maybe you should install yazi"
        echo "brew install yazi"
    fi
}
# setup config files
if [[ ! -d "${HOME}/.config/yazi" ]]; then
    mkdir -p "${HOME}/.config/yazi/" 
    ln -sf "${HOME}/dotfiles/yazi/init.lua" "${HOME}/.config/yazi/"
    ln -sf "${HOME}/dotfiles/yazi/theme.toml" "${HOME}/.config/yazi/"
    ln -sf "${HOME}/dotfiles/yazi/package.toml" "${HOME}/.config/yazi/"
    ln -sf "${HOME}/dotfiles/yazi/keymap.toml" "${HOME}/.config/yazi/"
    ln -sf "${HOME}/dotfiles/yazi/yazi.toml" "${HOME}/.config/yazi/"
    __intall_yazi
fi

echo "POWERLEVEL9K_INSTANT_PROMPT:" ${POWERLEVEL9K_INSTANT_PROMPT}
# 根据系统版本，每次运行 zsh 的时候自动运行安装脚本
echo "begining execute install script for $(uname)"
if [[ "$(uname)" == "Darwin" ]]; then
    source ${HOME}/dotfiles/script/macOS_install.sh
elif [[ "$(uname)" == "Linux" ]]; then
    # alios 7 == redhat centos 7
    result=$(uname -a)
    if [[ "$result" =~ "alios7" ]]; then
        source ${HOME}/dotfiles/script/centos_7_install.sh
    elif [[ "$result" =~ "el7" ]]; then
        source ${HOME}/dotfiles/script/centos_7_install.sh
    else
        echo "not support os: $result"
        exit 4
    fi
fi

echo "auto install complite!!!"
echo -n "$_new_version" > ${HOME}/dotfiles/script/.installed_version
