
# Language
export LANG=zh_CN.UTF-8
export LC_ALL=zh_CN.UTF-8
# 如果不支持中文可以改成英文,如果终端中出现如下报错，那么说明不支持中文
# -------
# my_git_formatter:34: character not in range
# my_git_formatter:34: character not in range
# _p9k_get_icon:13: character not in range
# -------
# 如果想解决可以参考：https://blog.csdn.net/omaidb/article/details/120104853
# refer https://github.com/romkatv/powerlevel10k/blob/master/README.md#error-character-not-in-range
# 在我的 centos7 系统上只需要安装 yum install -y glibc-langpack-zh 就好了
# export LANG=en_US.UTF-8
# export LC_ALL=en_US.UTF-8
# 如果是 centos 可以通过如下命令安装中文
# yum install kde-l10n-Chinese

# g verison manager
export GOROOT="${HOME}/.g/go"
export PATH="${HOME}/.g/go/bin:$PATH"
export G_MIRROR=https://golang.google.cn/dl/

# remote ssh clipboard
export PATH="${HOME}/dotfiles/nvim:$PATH"
# unalias g
# golang path
# export GOROOT=/usr/local/go/go1.12.14
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN
export GOPROXY="https://goproxy.io,https://mirrors.aliyun.com/goproxy,https://goproxy.cn,direct"

# homebrew exe path
export PATH=/usr/local/opt:${PATH}
# vscode 
export PATH=/Applications/vscode.app/Contents/Resources/app/bin:$PATH


# java 
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk8/jdk1.8.0_391.jdk/Contents/Home
export CLASS_PATH=$JAVA_HOME/lib
export PATH=$JAVA_HOME/bin:$PATH
export CATALINA_HOME=$HOME/java/apache-tomcat-8.5.47
export PATH=$PATH:$CATALINA_HOME/bin

export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/bin:$PATH"
export MYVIMRC='~/.config/nvim/init.vim'

which "brew" >/dev/null 2>&1
if [[ $? -ne 0 ]]; then
    if [[ -f /home/linuxbrew/.linuxbrew/bin/brew ]]; then
        eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    elif [[ -f /opt/homebrew/bin/brew ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
else
    # home brew env install
    eval "$(brew shellenv)"
fi
which "brew" >/dev/null 2>&1
if [ $? -eq 0 ]; then
    # Add seemingly missing pkg-config path? Not sure why this is happening...
    export PKG_CONFIG_PATH=$(brew --prefix)/lib/pkgconfig${PKG_CONFIG_PATH:+:${PKG_CONFIG_PATH}}
else
    echo "not found brew; maybe you can install it. refer: https://brew.sh"
    echo "linux homebrew doc: https://docs.brew.sh/Homebrew-on-Linux"

    # 选择是否自动安装 homebrew
    echo "auto intall homebrew?? [y/n]"
    read install_homebrew_flag
    if [[ "$install_homebrew_flag" == "n" ]] || [[ "$install_homebrew_flag" == "N" ]]; then
        echo "not install homebrew."
    else
        echo 'exec install script: /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        echo "\ninstall homebrew success!!!"
    fi
fi
