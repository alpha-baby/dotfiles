# dotfiles

保存自己的一些配置文件，用于快速配置新电脑的软件环境

# usually used soft

1. [jetbrains develop tool](https://www.jetbrains.com/)
  * Goland
  * ToolBox
  * IDEA
2. [chrome](https://www.google.com/chrome/)
3. [firefox](https://www.mozilla.org/zh-CN/firefox/new/?redirect_source=firefox-com)
4. [v2ray](https://github.com/v2ray/v2ray-core/releases)
5. [Nerd Font](https://www.nerdfonts.com/)
6. [burpsuite] [mac安装](https://www.sqlsec.com/2019/11/macbp.html) [破解](https://www.jianshu.com/p/3224c2308ffa)

## docker centos7

### Dockerfile

```dockerfile
FROM centos:7.8.2003

```

## macOS

### tool for mac

1. iPic -- picture bed tool | download from AppStore
2. [Homebrew](https://brew.sh/) - package manegement
3. [IINA](https://iina.io/)
4. [iTerm2](https://www.iterm2.com/)
5. [Nerd Font](https://www.nerdfonts.com/)
6. [vscode](https://code.visualstudio.com/)
7. [Go2Shell](http://zipzapmac.com/Go2Shell)
8. [docker]
9. [Mos]


### generate ssh key

```bash
ssh-keygen -t rsa -C "example@github.com"
```

### install command line tool

```bash
gem install colorls || brew install exa 
brew install   git \
               wget \
               nvim \
               trash \
               exa \
               python3 \
               autojump \
               tmux \
               htop \
               tree \
               neofetch \
               speedtest-cli \
               cloc \
               md5sha1sum \
               telnet \
               kubecm \
               lsd \
               clementtsang/bottom/bottom \
               tealdeer \
               ncdu
```

**多版本管理工具**

1. [nvm] nodejs多版本管理工具[官网](https://github.com/nvm-sh/nvm)，安装脚本`curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.30.2/install.sh | bash`
2. [g] golang多版本管理工具[官网](https://github.com/voidint/g)，安装脚本`curl -sSL https://raw.githubusercontent.com/voidint/g/master/install.sh | bash`
3. [sdk] java多版本工具[官网](https://sdkman.io/)，安装脚本`curl -s "https://get.sdkman.io" | bash && source "$HOME/.sdkman/bin/sdkman-init.sh" && sdk version`

一些极限情况下如果不能使用 nvm 那么可以手动下载 nodejs 的 release 包，手动解压安装的方式。[nodejs下载地址](https://mirrors.tuna.tsinghua.edu.cn/nodejs-release/)

### config 

#### 安装 neovim 插件管理器 vim-plug

https://github.com/junegunn/vim-plug

```bash
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

####  启动三指拖移

系统偏好设置->辅助功能->指针控制->触控板选项->启动拖移(三指拖移)

#### 设置vscode

**命令行打开**

打开 `VS Code`，打开控制面板`(⇧⌘P)`,输入 `"shell command"`，在提示里看到 `Shell Command: Install 'code' command in PATH`，运行它就可以了。
本质就是创建了软连接`ll`

或者手动把下面的配置添加在 `.zshrc`或者`.bashrc` 文件里：

export PATH="\$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
之后就可以在终端中输入 `code .`，使用 `VSCode` 打开当前文件夹。
或者直接使用 `code filename` 编辑文件。

**Font**

Hack Nerd Font

**插件**

1. Atom One Dark Theme
2. Go
3. Go Mod Grapher
4. Markdown Preview Enhanced
5. Markdown TOC
6. markdownlint
7. Material Icon Theme
8. PicGo
9. vscode-proto3

#### iTerm2

1. 配色安装vim 

```bash
mkdir ~/.iterm2 && cd ~/.iterm2

git clone https://github.com/mbadolato/iTerm2-Color-Schemes
```

iTerm2->Preferences->Profiles->Colors->Color Presets->Import->导入iTerm2-Color-Schemes->schemes全部
Preferences -> General -> Selection 下勾选 Applications in terminal may access clipboard

2. 设置字体

iTerm2->Preferences->Profiles->Text-->选上Use a different font for non-ASCII text,然后更换字体为`Hack Nerd Font`


3. 设置热键 双击contrl打开iterm2

![](https://tva1.sinaimg.cn/large/007S8ZIlly1ghmmvpbi23j30z60cywjs.jpg)

![](https://tva1.sinaimg.cn/large/007S8ZIlly1ghmn0fuxwhj30w40k0qhq.jpg)

> 参考 https://blog.csdn.net/wujunlei1595848/article/details/93880506

### zsh oh-my-zsh

>参考
>https://blog.biezhi.me/2018/11/build-a-beautiful-mac-terminal-environment.html

macOS自带了很多shell，我们可以通过如下命令查看有哪些

```bash
cat /etc/shells
```

bash是mac中terminal自带的shell，把它换成zsh，这个的功能要多得多。拥有语法高亮，命令行tab补全，自动提示符，显示Git仓库状态等功能。

使用下面命令设置默认shell：

```bash
sudo chsh -s /bin/zsh
```

如果提示chsh:no changes made 解决办法：终端输入： 

```bash
dscl . -read /Users/$USER/ UserShell 
exec su - $USER 
```

执行如下命令可以检查是否配置成功：

 ```bash
 echo $SHELL
 ```

**可能需要重启系统**

安装oh-my-zsh [https://github.com/ohmyzsh/ohmyzsh](https://github.com/ohmyzsh/ohmyzsh)

```bash
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### 安装 zi (zsh 插件管理工具)

原 zinit 项目被作者直接删除了

https://sdl.moe/post/zsh-conf/

可参考博文作者的配置 https://gist.github.com/Colerar/64edef4633d2fcede456170d3bd2f67e

https://wiki.zshell.dev/zh-Hans/docs/getting_started/installation

### node tools

#### reveal.js

```bash
npm install -g reveal.js
```

### tmux 配置

refer: https://www.bilibili.com/video/BV12y421h7rH/?spm_id_from=333.337.search-card.all.click&vd_source=3eff02c031fb023a8e5bb31e8baaa349

#### config shell script

**macOS_install.sh**

```bash
#!/bin/zsh
echo "创建tmux配置文件软连接"
ln -s ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/tmux/.tmux.conf.local ~/.tmux.conf.local
# 判断是否正确执行
if [ $? -eq 0 ]; then
     echo "创建tmux配置文件软连接 成功"
else
     echo "创建tmux配置文件软连接 失败"
fi

echo "创建nvim配置文件软连接"
mkdir -p ~/.config/nvim/
ln -s ~/dotfiles/nvim/init.vim ~/.config/nvim/
if [ $? -eq 0 ]; then
     echo "创建nvim配置文件软连接 成功"
else
     echo "创建nvim配置文件软连接 失败"
fi

echo "创建p10k配置文件软连接"
ln -s ~/dotfiles/p10k.zsh ~/.p10k.zsh
if [ $? -eq 0 ]; then
     echo "创建p10k配置文件软连接 成功"
else
     echo "创建p10k配置文件软连接 失败"
fi

# 加载zsh配置
echo "source ~/dotfiles/zsh/load.zsh" >> ~/.zshrc
```

# zsh加载速度优化

参考 https://zhuanlan.zhihu.com/p/68303393

# jetbrains

最新验证码：660913
idea激活码下载地址：https://www.ajihuo.com/idea/4222.html
