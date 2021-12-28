
# Language
LANG=zh_CN.UTF-8
# g verison manager
export GOROOT="${HOME}/.g/go"
export PATH="${HOME}/.g/go/bin:$PATH"
export G_MIRROR=https://golang.google.cn/dl/
# unalias g
# golang path
# export GOROOT=/usr/local/go/go1.12.14
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN

# homebrew exe path
export PATH=/usr/local/opt:${PATH}
# vscode 
export PATH=/Applications/vscode.app/Contents/Resources/app/bin:$PATH


# java 
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_231.jdk/Contents/Home
export CLASS_PATH=$JAVA_HOME/lib
export PATH=$JAVA_HOME/bin:$PATH
export CATALINA_HOME=$HOME/java/apache-tomcat-8.5.47
export PATH=$PATH:$CATALINA_HOME/bin

export PATH="/usr/local/sbin:$PATH"
export MYVIMRC='~/.config/nvim/init.vim'

