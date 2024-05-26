
# Language
export LANG=zh_CN.UTF-8
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
export MYVIMRC='~/.config/nvim/init.vim'

which "brew" >/dev/null 2>&1
if [ $? -eq 0 ]; then
    # home brew env install
    eval "$(brew shellenv)"
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


