# golang path
export GOROOT=/usr/local/go/go1.12.14
export GOPATH=~/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

function golist() {
    /bin/ls -al /usr/local/go/ |awk  -F ' '  '{print $9}' | /usr/bin/grep -e '^\w'
}

# homebrew exe path
export PATH=/usr/local/opt:${PATH}
# vscode 
export PATH=/Applications/vscode.app/Contents/Resources/app/bin:$PATH


# java 
export CATALINA_HOME=/usr/local/apache-tomcat-9.0.27
export PATH=$PATH:$CATALINA_HOME/bin

export PATH="/usr/local/sbin:$PATH"
export MYVIMRC='~/.config/nvim/init.vim'

# This loads nvm, nvm is mutil version manager of nodejs
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" 
