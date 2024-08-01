# ubuntu 20.04 配置开发环境

## set proxy

```
# 如果安装过程中出现网络问题会导致安装不上
# 可以先设置上代理后再执行安装
```

apt 和 dpkg 工具使用：https://www.cnblogs.com/eddyz/p/17175719.html

```bash
apt update
sudo apt install curl wget gcc 
sudo apt install zsh
sudo apt install bsdmainutils
sudo apt install screen ncurses-term ncurses-base
sudo apt install language-pack-zh*
# 安装 neovim 依赖的组件
sudo apt install python3 python3-neovim lua5.3
```

## 拉取配置

```bash
cd ${HOME}
git clone git@github.com:alpha-baby/dotfiles.git
```

## 安装 oh-my-zsh

下载 oh-my-zsh 项目来帮我们配置 zsh，采用wget安装(需要先安装git)

```bash
# 下载安装脚本
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
# 执行安装脚本
sh install.sh
```

## nvm node.js

> 参考 https://github.com/nvm-sh/nvm#installing-and-updating

```bash
nvm_install_script_url="https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh"
curl -o- $nvm_install_script_url | bash
# or
wget -qO- $nvm_install_script_url | bash
```

一些极限情况下如果不能使用 nvm 那么可以手动下载 nodejs 的 release 包，手动解压安装的方式。[nodejs下载地址](https://mirrors.tuna.tsinghua.edu.cn/nodejs-release/)

## linuxbrew(homebrew)

```bash
brew install nvim \
    trash-cli \
    lsd \
    autojump
```

## install nodejs

```bash
nvm ls-remote
nvm install {Version}
```

## nvim 插件安装

首先进入 nvim

然后执行

```bash
:PlugInstall
:CocInstall
# 检查 nvim 是否健康
:checkhealth
```

## tmux 安装配置

```bash
brew install tmux

tmux new -s tmp # 新建 tmux session
# 进入 tmux 后按快捷键：prefix+I（ctrl+b shift+i）
# 会自动安装 tmux 插件
```