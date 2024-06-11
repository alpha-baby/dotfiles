# ubuntu 20.04 配置开发环境

apt 和 dpkg 工具使用：https://www.cnblogs.com/eddyz/p/17175719.html

```bash
apt update
sudo apt install curl wget gcc 
sudo apt install zsh
sudo apt install bsdmainutils
sudo apt install screen ncurses-term ncurses-base
sudo apt install language-pack-zh*
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

## linuxbrew(homebrew)

```bash
brew install nvim trash-cli lsd
```